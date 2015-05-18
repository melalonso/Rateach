class CourseService
  def initialize(params)
    @course_id = params[:course_id]
    @user_id = params[:user_id]

  end

  def get_course_with_comments
      course = external_course_service.find(course_service_params)
      course.course_comments.each do |comment|
        comment.add_attrs(user_name: User.find(comment.user_id).name)
      end
    return course
  end

  def course_evaluated_for_user?
    return external_course_evaluation_service.where(course_where_params).size == 0
  end
  private
  attr_reader :course_id, :user_id

  def external_course_service
    Course
  end

  def external_course_evaluation_service
    CourseEvaluation
  end

  def course_service_params
    course_id
  end

  def course_where_params
    {
        user_id: user_id, course_id: course_id
    }
  end

end