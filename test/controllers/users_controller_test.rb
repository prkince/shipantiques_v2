require 'test_helper'

class UsersControllerTest < ActionDispatch::IntegrationTest
  test "should get annonces" do
    get users_annonces_url
    assert_response :success
  end

end
