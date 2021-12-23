class CreateFollowStockNewsletters < ActiveRecord::Migration[5.2]
  def change
    create_table :follow_stock_newsletters do |t|
      t.string :stock
      t.string :isin
      t.string :email
      t.boolean :active
      t.boolean :privacy
      t.string :referrer
      t.integer :sended, :default => 0
      t.integer :total_sended, :default => 0
      t.string :code

      t.timestamps
    end
  end
end
