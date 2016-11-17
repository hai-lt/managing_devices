require 'test_helper'

class RegistersControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get registers_index_url
    assert_response :success
  end

  test "should get update" do
    get registers_update_url
    assert_response :success
  end

  test "should get destroy" do
    get registers_destroy_url
    assert_response :success
  end

  test "should get edit" do
    get registers_edit_url
    assert_response :success
  end

  test "should get new" do
    get registers_new_url
    assert_response :success
  end

end
