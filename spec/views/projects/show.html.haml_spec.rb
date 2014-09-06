require 'rails_helper'

RSpec.describe "projects/show", :type => :view do
  before(:each) do
    @project = assign(:project, Project.create!(
      :name => "Name",
      :description => "Description",
      :status => "Status",
      :date_to => "Date To"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/Description/)
    expect(rendered).to match(/Status/)
    expect(rendered).to match(/Date To/)
  end
end
