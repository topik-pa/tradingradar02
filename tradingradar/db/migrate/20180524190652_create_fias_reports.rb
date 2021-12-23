class CreateFiasReports < ActiveRecord::Migration[5.2]
  def change
    create_table :fias_reports do |t|
      t.string :isin, null: false, unique: true
      t.string :stock
      t.decimal :borsaitaliana_support, precision: 8, scale: 4
      t.decimal :borsaitaliana_resistance, precision: 8, scale: 4
      t.integer :borsaitaliana_fta
      t.decimal :borsaitaliana_rsi
      t.decimal :borsaitaliana_volatility

      t.string :sole24ore_shorttrend
      t.string :sole24ore_mediumtrend
      t.string :sole24ore_rating
      t.integer :sole24ore_relativestrenght

      t.decimal :sole24ore_support, precision: 8, scale: 4
      t.decimal :sole24ore_resistance, precision: 8, scale: 4
      t.string :sole24ore_shorttrend
      t.integer :sole24ore_fta
      t.integer :sole24ore_rsi
      t.string :sole24ore_rsidiv
      t.text :sole24ore_strategy

      t.decimal :milanofinanza_risk
      t.string :milanofinanza_rating
      t.string :milanofinanza_trendshort
      t.string :milanofinanza_trendmedium
      t.string :milanofinanza_trendlong
      t.decimal :teleborsa_support, precision: 8, scale: 4
      t.decimal :teleborsa_resistance, precision: 8, scale: 4

      t.timestamps
    end
  end
end
