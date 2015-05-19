class CourseCommentsController < ApplicationController
  before_action :set_course_comment, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @course_comments = CourseComment.all
    respond_with(@course_comments)
  end

  def show
    respond_with(@course_comment)
  end

  def new
    @course_comment = CourseComment.new
    respond_with(@course_comment)
  end

  def edit
  end

  def create
    @course_comments = create_with_course_comment_service
    render json: {id: @course_comments.id,date: @course_comments.created_at.strftime('%d %b %Y %I:%M %p')}
  end

  def update
    @course_comment.update(course_comment_params)
    respond_with(@course_comment)
  end

  def destroy
    @course_comment.destroy
    render json: @course_comment
  end

  private
    def set_course_comment
      @course_comment = CourseComment.find(params[:id])
    end

    def course_comment_params
      params.require(:course_comment).permit(:content)
    end

    def create_with_course_comment_service
      CourseCommentService.new({ content:params[:content] , user_id:params[:user_id], course_id:params[:course_id]}).insert_comment
    end
end
