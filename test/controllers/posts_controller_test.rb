require "test_helper"

class PostsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get posts_index_url
    assert_response :success
  end

  test "should get my_index" do
    get posts_my_index_url
    assert_response :success
  end

  test "should get user_index" do
    get posts_user_index_url
    assert_response :success
  end

  test "should get bookmark_index" do
    get posts_bookmark_index_url
    assert_response :success
  end

  test "should get new" do
    get posts_new_url
    assert_response :success
  end

  test "should get show" do
    get posts_show_url
    assert_response :success
  end

  test "should get edit" do
    get posts_edit_url
    assert_response :success
  end
end
