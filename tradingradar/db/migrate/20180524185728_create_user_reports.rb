class CreateUserReports < ActiveRecord::Migration[5.2]
  def change
    create_table :user_reports do |t|
      t.string :isin, null: false, unique: true
      t.string :stock
      t.decimal :support, precision: 8, scale: 4
      t.decimal :resistance, precision: 8, scale: 4
      t.string :trendshort
      t.string :trendmedium
      t.string :trendlong
      t.integer :rating
      t.text :note
      t.decimal :buy, precision: 8, scale: 4
      t.decimal :sell, precision: 8, scale: 4
      t.decimal :sl, precision: 8, scale: 4

      t.timestamps
    end
  end
end
