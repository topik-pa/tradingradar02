class CreateCac40Reports < ActiveRecord::Migration[5.2]
  def change
    create_table :cac40_reports do |t|
      t.string :isin, null: false, unique: true
      t.string :stock
      t.string :tradingsat_trendshort
      t.string :tradingsat_trendmedium
      t.string :tradingsat_trendlong
      t.decimal :boursefortuneo_support, precision: 8, scale: 4
      t.decimal :boursefortuneo_resistance, precision: 8, scale: 4
      t.decimal :boursefortuneo_volatility
      t.decimal :boursefortuneo_target, precision: 8, scale: 4
      t.string :boursefortuneo_rating
      t.string :boursefortuneo_trendshort
      t.string :boursefortuneo_trendmedium
      t.string :zonebourse_trendshort
      t.string :zonebourse_trendmedium
      t.string :zonebourse_trendlong
      t.decimal :zonebourse_resistance, precision: 8, scale: 4
      t.decimal :zonebourse_support, precision: 8, scale: 4
      t.string :abcbourse_consensus
      t.string :abcbourse_tendency
      t.string :lefigaro_consensus

      t.timestamps
    end
  end
end
