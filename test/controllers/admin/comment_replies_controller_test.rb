require "test_helper"

class Admin::CommentRepliesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get admin_comment_replies_index_url
    assert_response :success
  end
end
