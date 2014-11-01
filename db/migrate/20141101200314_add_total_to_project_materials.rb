class AddTotalToProjectMaterials < ActiveRecord::Migration
  def change
    change_table(:project_materials) do |t|
      t.float :total, default: 0
    end
  end
end
