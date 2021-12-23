class AddOmniauthToFollowers < ActiveRecord::Migration[5.2]
  def change
    add_column :followers, :provider, :string
    add_column :followers, :uid, :string
    add_column :followers, :name, :string
    add_column :followers, :image, :text
  end
end
