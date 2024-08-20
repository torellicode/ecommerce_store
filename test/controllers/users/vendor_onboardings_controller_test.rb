require "test_helper"

class Users::VendorOnboardingsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get users_vendor_onboardings_new_url
    assert_response :success
  end

  test "should get create" do
    get users_vendor_onboardings_create_url
    assert_response :success
  end
end
