require 'test_helper'

class TeacherCommentsControllerTest < ActionController::TestCase
  setup do
    @teacher_comment = teacher_comments(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:teacher_comments)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create teacher_comment" do
    assert_difference('TeacherComment.count') do
      post :create, teacher_comment: { content: @teacher_comment.content }
    end

    assert_redirected_to teacher_comment_path(assigns(:teacher_comment))
  end

  test "should show teacher_comment" do
    get :show, id: @teacher_comment
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @teacher_comment
    assert_response :success
  end

  test "should update teacher_comment" do
    patch :update, id: @teacher_comment, teacher_comment: { content: @teacher_comment.content }
    assert_redirected_to teacher_comment_path(assigns(:teacher_comment))
  end

  test "should destroy teacher_comment" do
    assert_difference('TeacherComment.count', -1) do
      delete :destroy, id: @teacher_comment
    end

    assert_redirected_to teacher_comments_path
  end
end
