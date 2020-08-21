require 'rails_helper'

RSpec.describe "upload_csvs/new", type: :view do
  before(:each) do
    assign(:upload_csv, UploadCsv.new(
      users: "MyText",
      csv_file: "MyString",
      generated_csv: "MyString"
    ))
  end

  it "renders new upload_csv form" do
    render

    assert_select "form[action=?][method=?]", upload_csvs_path, "post" do

      assert_select "textarea[name=?]", "upload_csv[users]"

      assert_select "input[name=?]", "upload_csv[csv_file]"

      assert_select "input[name=?]", "upload_csv[generated_csv]"
    end
  end
end
