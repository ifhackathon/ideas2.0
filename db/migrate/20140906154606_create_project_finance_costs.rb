class CreateProjectFinanceCosts < ActiveRecord::Migration
  def change
    create_table :project_finance_costs do |t|
      t.string :name
      t.float :money

      t.timestamps
    end
  end
end
