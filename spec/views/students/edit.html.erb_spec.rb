require 'rails_helper'

RSpec.describe 'students/edit', type: :view do
  before(:each) do
    @student = assign(:student, Student.create!(
                                  name: 'MyString',
                                  url: 'MyText'
                                ))
  end

  it 'renders the edit student form' do
    render

    assert_select 'form[action=?][method=?]', student_path(@student), 'post' do
      assert_select 'input[name=?]', 'student[name]'

      assert_select 'textarea[name=?]', 'student[url]'
    end
  end
end
