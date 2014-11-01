class AddTotalToProjectFinanceCosts < ActiveRecord::Migration
  def change
    change_table(:project_finance_costs) do |t|
      t.float :total, default: 0
    end
  end
end
