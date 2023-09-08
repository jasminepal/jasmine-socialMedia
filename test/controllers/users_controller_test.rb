require "test_helper"

class UsersControllerTest < ActionDispatch::IntegrationTest
  test "should get sign_up_params" do
    get users_sign_up_params_url
    assert_response :success
  end
end
