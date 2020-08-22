require 'rails_helper'

RSpec.describe 'upload_csvs/index', type: :view do
  before(:each) do
    assign(:upload_csvs, [
             UploadCsv.create!(
               users: 'MyText',
               csv_file: 'Csv File',
               generated_csv: 'Generated Csv'
             ),
             UploadCsv.create!(
               users: 'MyText',
               csv_file: 'Csv File',
               generated_csv: 'Generated Csv'
             )
           ])
  end

  it 'renders a list of upload_csvs' do
    render
    assert_select 'tr>td', text: 'MyText'.to_s, count: 2
    assert_select 'tr>td', text: 'Csv File'.to_s, count: 2
    assert_select 'tr>td', text: 'Generated Csv'.to_s, count: 2
  end
end
