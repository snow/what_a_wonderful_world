class CreateExpenses < ActiveRecord::Migration[5.0]
  def change
    create_table :expenses do |t|
      t.references :profile, index: false # , foreign_key: true
      t.string :name
      t.integer :category
      t.integer :amount_cent
      t.datetime :date
      t.references :monthly_stat, index: false
      t.references :periodic_expense, index: false

      t.timestamps
    end
  end
end
