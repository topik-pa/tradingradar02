require 'test_helper'

class MessageControllerTest < ActionDispatch::IntegrationTest
  test "should get emailreset" do
    get message_emailreset_url
    assert_response :success
  end

end
