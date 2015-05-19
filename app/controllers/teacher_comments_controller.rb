class TeacherCommentsController < ApplicationController
  before_action :set_teacher_comment, only: [:show, :edit, :update]

  respond_to :html

  def index
    @teacher_comments = TeacherComment.all
    respond_with(@teacher_comments)
  end

  def show
    respond_with(@teacher_comment)
  end

  def new
    @teacher_comment = TeacherComment.new
    respond_with(@teacher_comment)
  end

  def edit
  end

  def create
    @teacher_comment = create_with_teacher_comment_service
    render json: {id: @teacher_comment.id,date: @teacher_comment.created_at.strftime('%d %b %Y %I:%M %p')}
  end

  def update
    @teacher_comment.update(teacher_comment_params)
    respond_with(@teacher_comment)
  end

  def destroy
    @teacher_comment = TeacherComment.find(params[:id])
    @teacher_comment.destroy
    render json: @teacher_comment
  end

  private

  def set_teacher_comment
    begin
      @teacher_comment = TeacherComment.find(params[:teacher_id])
    rescue
      @teacher_comment = TeacherComment.find(params[:id])
    end

  end

  def teacher_comment_params
    params.require(:teacher_comment).permit(:teacher_id,:user_id,:content,:id)
  end

  def create_with_teacher_comment_service
    TeacherCommentService.new({ content:params[:content] , user_id:params[:user_id], teacher_id:params[:teacher_id]}).insert_comment
  end
end
