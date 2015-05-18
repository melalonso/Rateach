class TeacherCommentsController < ApplicationController
  before_action :set_teacher_comment, only: [:show, :edit, :update, :destroy]

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
    render text: @teacher_comment.created_at.strftime('%d %b %Y %I:%M %p')
  end

  def update
    @teacher_comment.update(teacher_comment_params)
    respond_with(@teacher_comment)
  end

  def destroy
    @teacher_comment.destroy
    respond_with(@teacher_comment)
  end

  private
    def set_teacher_comment
      @teacher_comment = TeacherComment.find(params[:teacher_id])
    end

    def teacher_comment_params
      params.require(:teacher_comment).permit(:teacher_id,:user_id,:content)
    end

    def create_with_teacher_comment_service
      TeacherCommentService.new({ content:params[:content] , user_id:params[:user_id], teacher_id:params[:teacher_id]}).insert_comment
    end
end
