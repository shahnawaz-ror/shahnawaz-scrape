class GenrateCsvJob < ApplicationJob
  queue_as :default

  def perform(upload_csv)
    processed_csv(upload_csv)
    file = Tempfile.open(["#{Rails.root}/public/generated_csv", '.csv']) do |csv|
      csv << %w[referal_link home_link count]
      @new_array.each do |new_array|
        csv << new_array
      end
      file = "#{Rails.root}/public/product_data.csv"
      headers = ['referal_link', 'home_link', 'count']
      file = CSV.open(file, 'w', write_headers: true, headers: headers) do |writer|
        @new_array.each do |new_array|
          writer << new_array
        end
        upload_csv.update(generated_csv: file)
      end
    end
    if @new_array.present?
      UserMailer.send_csv(upload_csv).deliver_now!
      EventBroadcastJob.set(wait: 8.seconds).perform_later "Your csv is sent to the below users #{upload_csv.users}"
    else
      EventBroadcastJob.set(wait: 8.seconds).perform_later "Invalid csv please change attachment or try again."
    end
  end

  # Method to get the link count and stores in the array
  def processed_csv(upload_csv)
    @new_array = []
    CSV.foreach(upload_csv.csv_file.path, headers: true, header_converters: :symbol) do |row|
      row_map = row.to_h
      page = HTTParty.get(row_map[:refferal_link])
      page_parse = Nokogiri::HTML(page)
      link_array = page_parse.css('a').map { |link| link['href'] }
      link_array_group = link_array.group_by(&:itself).map { |k, v| [k, v.length] }.to_h
      @new_array.push([row_map[:refferal_link], row_map[:home_link], (link_array_group[row_map[:home_link]]).to_s])
    end
  end
end
