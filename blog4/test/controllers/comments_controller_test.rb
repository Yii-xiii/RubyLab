require "test_helper"

class CommentsControllerTest < ActionDispatch::IntegrationTest
=begin
  setup do
    @comment = comments(:one)
    @blog = blogs(:one)
  end

  test "should get index" do
    get blog_url(@blog)
    assert_response :success
  end

  test "should get new" do
    get new_blog_comment_url(@blog)
    assert_response :success
  end


  test "should create comment" do
    assert_difference('Comment.count') do
      post blog_comments_url(@blog), params:{ comment: { content: @comment.content} }
    end
    assert_redirected_to blog_url(@blog)
  end

  test "should show comment" do
    get blog_comment_url(@blog,@comment)
    assert_response :success
  end

  test "should get edit" do
    get edit_blog_comment_url(@blog,@comment)
    assert_response :success
  end

  test "should update comment" do
    patch blog_comment_url(@blog,@comment), params: { comment: { content: @comment.content } }
    assert_redirected_to blog_url(@blog)
  end

  test "should destroy comment" do
    assert_difference('Comment.count', -1) do
      delete blog_comment_url(@blog,@comment)
    end

    assert_redirected_to blog_url(@blog)
  end

=end
end
