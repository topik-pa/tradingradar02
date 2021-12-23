require 'test_helper'

class StockControllerTest < ActionDispatch::IntegrationTest
  test "should get press_release" do
    get stock_press_release_url
    assert_response :success
  end

end
