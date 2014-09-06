class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.string :name
      t.string :description
      t.string :status
      t.string :date_to

      t.timestamps
    end
  end
end
