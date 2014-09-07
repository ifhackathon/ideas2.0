class ChangeColumnTypeInProject < ActiveRecord::Migration
  def change
    change_column :projects, :date_to, :date
  end
end
