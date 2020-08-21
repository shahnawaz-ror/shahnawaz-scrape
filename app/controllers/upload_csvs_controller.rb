class UploadCsvsController < ApplicationController
  before_action :set_upload_csv, only: [:show, :edit, :update, :destroy]
  require 'csv'
  require 'httparty'
  require 'nokogiri'
  # GET /upload_csvs
  # GET /upload_csvs.json
  def index
    @upload_csvs = UploadCsv.all
    generated_csv_updates(UploadCsv.last)
  end

  # GET /upload_csvs/1
  # GET /upload_csvs/1.json
  def show
  end

  # GET /upload_csvs/new
  def new
    @upload_csv = UploadCsv.new
  end

  # GET /upload_csvs/1/edit
  def edit
  end

  # POST /upload_csvs
  # POST /upload_csvs.json
  def create
    @upload_csv = UploadCsv.new(upload_csv_params)
    respond_to do |format|
      if @upload_csv.save
        generated_csv_updates(@upload_csv)
        format.html { redirect_to @upload_csv, notice: 'Upload csv was successfully created.' }
        format.json { render :show, status: :created, location: @upload_csv }
      else
        format.html { render :new }
        format.json { render json: @upload_csv.errors, status: :unprocessable_entity }
      end
    end
  end


  def generated_csv_updates(upload_csv)
  @new_array = []
  CSV.foreach(upload_csv.csv_file.path,headers: true, header_converters: :symbol) do |row|
    puts row.to_h[:refferal_link]

    row_map = row.to_h
    page = HTTParty.get(row_map[:refferal_link])
    page_parse = Nokogiri::HTML(page)
    link_array = page_parse.css('a').map { |link| link['href'] }
    link_array_group = link_array.group_by(&:itself).map { |k,v| [k, v.length] }.to_h
    @new_array.push([row_map[:refferal_link],row_map[:home_link],"#{link_array_group[row_map[:home_link]]}"])  
  end
    file = Tempfile.open(["#{Rails.root}/public/generated_csv", ".csv"]) do |csv|
     csv << ["referal_link", "home_link", "count"]
     @new_array.each do |new_array|
        csv << new_array
    end
    file = "#{Rails.root}/public/product_data.csv"
    headers = ["referal link", "home_link", "count"]
    file = CSV.open(file, 'w', write_headers: true, headers: headers) do |writer|
       @new_array.each do |new_array|
        writer << new_array
    end
    
    upload_csv.update(:generated_csv => file)
    end
  end
    UserMailer.send_csv(upload_csv).deliver_now!
end
  # PATCH/PUT /upload_csvs/1
  # PATCH/PUT /upload_csvs/1.json
  def update
    respond_to do |format|
      if @upload_csv.update(upload_csv_params)
        format.html { redirect_to @upload_csv, notice: 'Upload csv was successfully updated.' }
        format.json { render :show, status: :ok, location: @upload_csv }
      else
        format.html { render :edit }
        format.json { render json: @upload_csv.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /upload_csvs/1
  # DELETE /upload_csvs/1.json
  def destroy
    @upload_csv.destroy
    respond_to do |format|
      format.html { redirect_to upload_csvs_url, notice: 'Upload csv was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_upload_csv
      @upload_csv = UploadCsv.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def upload_csv_params
      params.require(:upload_csv).permit(:csv_file, :generated_csv, users: [])
    end
  end
