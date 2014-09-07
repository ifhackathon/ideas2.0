class AddProjectRelationToEstimate < ActiveRecord::Migration
  def change
    change_table(:estimates) do |t|
      t.references :project, index: true
    end
  end
end
