class CreateSourceItalies < ActiveRecord::Migration[5.2]
  def change
    create_table :source_italies do |t|
      t.string :isin
      t.string :name
      t.string :url_0
      t.string :url_1
      t.string :url_2
      t.string :url_3
      t.string :url_4
      t.string :url_5
      t.string :url_6
      t.string :url_7
      t.string :url_8
      t.string :url_9
      t.string :url_10
      t.string :url_11

      t.timestamps
    end
  end
end
