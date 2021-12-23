class AddMarketToAnalyses < ActiveRecord::Migration[5.2]
  def change
    add_column :analyses, :market, :string
  end
end
