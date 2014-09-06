require 'rails_helper'

RSpec.describe "projects/index", :type => :view do
  before(:each) do
    assign(:projects, [
      Project.create!(
        :name => "Name",
        :description => "Description",
        :status => "Status",
        :date_to => "Date To"
      ),
      Project.create!(
        :name => "Name",
        :description => "Description",
        :status => "Status",
        :date_to => "Date To"
      )
    ])
  end

  it "renders a list of projects" do
    render
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "Description".to_s, :count => 2
    assert_select "tr>td", :text => "Status".to_s, :count => 2
    assert_select "tr>td", :text => "Date To".to_s, :count => 2
  end
end
