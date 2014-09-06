class AddFieldsToProjects < ActiveRecord::Migration
  def change
    add_column :projects, :place, :string
    add_column :projects, :video, :string
  end
end
