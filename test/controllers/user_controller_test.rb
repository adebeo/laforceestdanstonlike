require 'test_helper'

class UserControllerTest < ActionDispatch::IntegrationTest
  test "should get ip:string" do
    get user_ip:string_url
    assert_response :success
  end

end
