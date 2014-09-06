class AddProjectRefToProjectFinanceCosts < ActiveRecord::Migration
  def change
    add_reference :project_finance_costs, :project, index: true
  end
end
