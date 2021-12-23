require 'test_helper'

class MarketControllerTest < ActionDispatch::IntegrationTest
  test "should get italy_ftsemib" do
    get market_italy_ftsemib_url
    assert_response :success
  end

  test "should get france_cac40" do
    get market_france_cac40_url
    assert_response :success
  end

end
