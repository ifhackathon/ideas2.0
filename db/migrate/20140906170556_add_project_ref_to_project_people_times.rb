class AddProjectRefToProjectPeopleTimes < ActiveRecord::Migration
  def change
    add_reference :project_people_times, :project, index: true
  end
end
