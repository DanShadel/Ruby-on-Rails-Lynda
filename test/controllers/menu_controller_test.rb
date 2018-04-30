require 'test_helper'

class MenuControllerTest < ActionDispatch::IntegrationTest
  test "should get main" do
    get menu_main_url
    assert_response :success
  end

end
