require 'test_helper'

class SourceTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  test "new empty source" do
    source = Source.new
    assert source.invalid?
    assert source.errors[:isin].any?
  end
  
  test "new source from fixture one" do
    source = sources(:one)
    assert source.valid?
    source.isin = ''
    assert source.invalid?
  end
end



    