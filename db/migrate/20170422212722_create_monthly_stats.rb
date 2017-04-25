class CreateMonthlyStats < ActiveRecord::Migration[5.0]
  def change
    create_table :monthly_stats do |t|
      t.references :profile, index: false # foreign_key: true
      t.datetime :date
      t.integer :balance_cent

      t.timestamps

      t.index [:profile_id, :date], unique: true
    end
  end
end
