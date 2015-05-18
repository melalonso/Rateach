require 'test_helper'

class CourseCommentsControllerTest < ActionController::TestCase
  setup do
    @course_comment = course_comments(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:course_comments)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create course_comment" do
    assert_difference('CourseComment.count') do
      post :create, course_comment: { content: @course_comment.content }
    end

    assert_redirected_to course_comment_path(assigns(:course_comment))
  end

  test "should show course_comment" do
    get :show, id: @course_comment
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @course_comment
    assert_response :success
  end

  test "should update course_comment" do
    patch :update, id: @course_comment, course_comment: { content: @course_comment.content }
    assert_redirected_to course_comment_path(assigns(:course_comment))
  end

  test "should destroy course_comment" do
    assert_difference('CourseComment.count', -1) do
      delete :destroy, id: @course_comment
    end

    assert_redirected_to course_comments_path
  end
end
