require 'rails_helper'

RSpec.describe 'upload_csvs/show', type: :view do
  before(:each) do
    @upload_csv = assign(:upload_csv, UploadCsv.create!(
                                        users: 'MyText',
                                        csv_file: 'Csv File',
                                        generated_csv: 'Generated Csv'
                                      ))
  end

  it 'renders attributes in <p>' do
    render
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(/Csv File/)
    expect(rendered).to match(/Generated Csv/)
  end
end
