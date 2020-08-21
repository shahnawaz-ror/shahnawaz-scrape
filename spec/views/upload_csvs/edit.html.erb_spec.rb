require 'rails_helper'

RSpec.describe "upload_csvs/edit", type: :view do
  before(:each) do
    @upload_csv = assign(:upload_csv, UploadCsv.create!(
      users: "MyText",
      csv_file: "MyString",
      generated_csv: "MyString"
    ))
  end

  it "renders the edit upload_csv form" do
    render

    assert_select "form[action=?][method=?]", upload_csv_path(@upload_csv), "post" do

      assert_select "textarea[name=?]", "upload_csv[users]"

      assert_select "input[name=?]", "upload_csv[csv_file]"

      assert_select "input[name=?]", "upload_csv[generated_csv]"
    end
  end
end
