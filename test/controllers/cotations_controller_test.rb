require 'test_helper'

class CotationsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get cotations_new_url
    assert_response :success
  end

  test "should get create" do
    get cotations_create_url
    assert_response :success
  end

end
