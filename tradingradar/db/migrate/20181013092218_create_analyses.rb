class CreateAnalyses < ActiveRecord::Migration[5.2]
  def change
    create_table :analyses do |t|
      t.string :title
      t.text :description
      t.text :body
      t.string :stock
      t.string :reuters
      t.string :isin
      t.string :author
      t.string :slug

      t.timestamps
    end
    add_index :analyses, :slug, unique: true
  end
end
