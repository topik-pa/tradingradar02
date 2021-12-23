require 'test_helper'

class PagesControllerTest < ActionDispatch::IntegrationTest
  test "should get contatti" do
    get pages_contatti_url
    assert_response :success
  end

end
