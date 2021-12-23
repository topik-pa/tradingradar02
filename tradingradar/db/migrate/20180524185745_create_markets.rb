class CreateMarkets < ActiveRecord::Migration[5.2]
  def change
    create_table :markets do |t|
      t.string :name, null: false, unique: true
      t.decimal :value, precision: 8, scale: 4
      t.decimal :variation, precision: 8, scale: 4
      t.string :country
      #t.string :source
      #t.string :path
      #t.string :path2
      #t.string :target

      t.timestamps
    end
  end
end
