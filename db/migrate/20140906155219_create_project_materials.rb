class CreateProjectMaterials < ActiveRecord::Migration
  def change
    create_table :project_materials do |t|
      t.string :name
      t.float :quantity
      t.string :measure

      t.timestamps
    end
  end
end
