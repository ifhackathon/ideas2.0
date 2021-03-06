require 'rails_helper'

RSpec.describe "projects/new", :type => :view do
  before(:each) do
    assign(:project, Project.new(
      :name => "MyString",
      :description => "MyString",
      :status => "MyString",
      :date_to => "MyString"
    ))
  end

  it "renders new project form" do
    render

    assert_select "form[action=?][method=?]", projects_path, "post" do

      assert_select "input#project_name[name=?]", "project[name]"

      assert_select "input#project_description[name=?]", "project[description]"

      assert_select "input#project_status[name=?]", "project[status]"

      assert_select "input#project_date_to[name=?]", "project[date_to]"
    end
  end
end
