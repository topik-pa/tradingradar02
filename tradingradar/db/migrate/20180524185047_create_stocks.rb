class CreateStocks < ActiveRecord::Migration[5.2]
  def change
    create_table :stocks do |t|
      t.string :isin, null: false, unique: true
      t.string :reuters, unique: true
      t.string :name
      t.string :sector
      t.decimal :last_price, precision: 8, scale: 4
      t.decimal :variation
      t.string :market_phase
      t.string :corporate_url
      t.string :address
      t.string :phone
      t.string :market
      t.string :currency
      t.text :profile
      t.string :keywords
      t.decimal :dividend, precision: 8, scale: 4
      t.string :dividend_date
      t.decimal :dividend_yeld
      t.decimal :performance1
      t.decimal :performance6
      t.decimal :performance12
      t.string :code, unique: true

      t.timestamps
    end
  end
end
