require 'test_helper'

class PressReleaseControllerTest < ActionDispatch::IntegrationTest
  test "should get source1" do
    get press_release_source1_url
    assert_response :success
  end

  test "should get source2" do
    get press_release_source2_url
    assert_response :success
  end

  test "should get source3" do
    get press_release_source3_url
    assert_response :success
  end

  test "should get source4" do
    get press_release_source4_url
    assert_response :success
  end

  test "should get source5" do
    get press_release_source5_url
    assert_response :success
  end

  test "should get source6" do
    get press_release_source6_url
    assert_response :success
  end

end
