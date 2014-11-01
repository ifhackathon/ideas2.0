class AddTotalToProjectPeopleTimes < ActiveRecord::Migration
  def change
    change_table(:project_people_times) do |t|
      t.float :total, default: 0
    end
  end
end
