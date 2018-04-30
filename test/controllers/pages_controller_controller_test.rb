require 'test_helper'

class PagesControllerControllerTest < ActionDispatch::IntegrationTest
  test "should get edit" do
    get pages_controller_edit_url
    assert_response :success
  end

  test "should get show" do
    get pages_controller_show_url
    assert_response :success
  end

  test "should get index" do
    get pages_controller_index_url
    assert_response :success
  end

  test "should get delete" do
    get pages_controller_delete_url
    assert_response :success
  end

end
