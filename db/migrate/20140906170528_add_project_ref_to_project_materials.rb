class AddProjectRefToProjectMaterials < ActiveRecord::Migration
  def change
    add_reference :project_materials, :project, index: true
  end
end
