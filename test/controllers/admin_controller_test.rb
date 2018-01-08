require 'test_helper'

class AdminControllerTest < ActionDispatch::IntegrationTest
  test "should get dash" do
    get admin_dash_url
    assert_response :success
  end

end
