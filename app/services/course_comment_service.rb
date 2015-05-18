
class CourseCommentService
  def initialize(params)
    @content = params[:content]
    @course_id = params[:course_id]
    @user_id = params[:user_id]
  end

  def insert_comment
    begin
      external_course_comment_service.create(course_comment_attributes)
    rescue
      false
    end
  end

  private
  attr_reader :content , :course_id , :user_id
  def external_course_comment_service
    CourseComment
  end

  def course_comment_attributes
    {
        content: content, course_id: course_id, user_id: user_id
    }
  end

end