class CreatePeriodicIncomes < ActiveRecord::Migration[5.0]
  def change
    create_table :periodic_incomes do |t|
      t.references :profile, index: false # , foreign_key: true
      t.string :name
      t.integer :period
      t.datetime :starts_at
      t.datetime :ends_at
      t.integer :period_amount_cent

      t.timestamps
    end
  end
end
