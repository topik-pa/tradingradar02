require 'test_helper'

class StockTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  test "new empty stock" do
    stock = Stock.new
    assert stock.invalid?
    assert stock.errors[:isin].any?
  end

  test "new stock from fixture one" do
    stock = stocks(:one)
    assert stock.valid?
    stock.isin = ''
    assert stock.invalid?
  end
  
end
