require 'test_helper'

class DevicesControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get devices_show_url
    assert_response :success
  end

  test "should get index" do
    get devices_index_url
    assert_response :success
  end

  test "should get edit" do
    get devices_edit_url
    assert_response :success
  end

  test "should get destroy" do
    get devices_destroy_url
    assert_response :success
  end

  test "should get update" do
    get devices_update_url
    assert_response :success
  end

end
