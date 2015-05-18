
class TeacherCommentService
  def initialize(params)
    @content = params[:content]
    @teacher_id = params[:teacher_id]
    @user_id = params[:user_id]
  end

  def insert_comment
    begin
      external_teacher_comment_service.create(teacher_comment_attributes)
    rescue
      false
    end
  end

  private
  attr_reader :content , :teacher_id , :user_id
  def external_teacher_comment_service
    TeacherComment
  end

  def teacher_comment_attributes
    {
        content: content, teacher_id: teacher_id, user_id: user_id
    }
  end

end