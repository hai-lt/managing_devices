require 'test_helper'

class RanksControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get ranks_create_url
    assert_response :success
  end

  test "should get index" do
    get ranks_index_url
    assert_response :success
  end

  test "should get update" do
    get ranks_update_url
    assert_response :success
  end

  test "should get destroy" do
    get ranks_destroy_url
    assert_response :success
  end

  test "should get show" do
    get ranks_show_url
    assert_response :success
  end

  test "should get edit" do
    get ranks_edit_url
    assert_response :success
  end

  test "should get new" do
    get ranks_new_url
    assert_response :success
  end

end
