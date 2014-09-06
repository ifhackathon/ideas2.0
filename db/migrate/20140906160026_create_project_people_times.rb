class CreateProjectPeopleTimes < ActiveRecord::Migration
  def change
    create_table :project_people_times do |t|
      t.string :name
      t.string :day
      t.string :integer

      t.timestamps
    end
  end
end
