class CreateDax30Reports < ActiveRecord::Migration[5.2]
  def change
    create_table :dax30_reports do |t|
      t.string :isin, null: false, unique: true
      t.string :stock
      t.decimal :finanzen_rating
      t.decimal :finanzen_ratingmoodys
      t.decimal :finanzen_sentiment

      t.timestamps
    end
  end
end
