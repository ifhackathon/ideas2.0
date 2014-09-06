require 'rails_helper'

RSpec.describe "projects/edit", :type => :view do
  before(:each) do
    @project = assign(:project, Project.create!(
      :name => "MyString",
      :description => "MyString",
      :status => "MyString",
      :date_to => "MyString"
    ))
  end

  it "renders the edit project form" do
    render

    assert_select "form[action=?][method=?]", project_path(@project), "post" do

      assert_select "input#project_name[name=?]", "project[name]"

      assert_select "input#project_description[name=?]", "project[description]"

      assert_select "input#project_status[name=?]", "project[status]"

      assert_select "input#project_date_to[name=?]", "project[date_to]"
    end
  end
end
