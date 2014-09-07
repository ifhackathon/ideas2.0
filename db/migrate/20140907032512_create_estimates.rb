class CreateEstimates < ActiveRecord::Migration
  def change
    create_table :estimates do |t|
      t.references :user, index: true
      t.references :estimateble, index: true
      t.string :value
      t.string :date
      t.string :estimateble_type

      t.timestamps
    end
  end
end
