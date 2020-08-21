require 'rails_helper'

RSpec.describe "students/index", type: :view do
  before(:each) do
    assign(:students, [
      Student.create!(
        name: "Name",
        url: "MyText"
      ),
      Student.create!(
        name: "Name",
        url: "MyText"
      )
    ])
  end

  it "renders a list of students" do
    render
    assert_select "tr>td", text: "Name".to_s, count: 2
    assert_select "tr>td", text: "MyText".to_s, count: 2
  end
end
