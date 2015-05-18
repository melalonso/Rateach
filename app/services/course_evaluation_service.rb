
class CourseEvaluationService
  def initialize(params)
    @course_id = params[:course_id]
    @user_id = params[:user_id]
    @rubric1 = params[:rubric1]
    @rubric2 = params[:rubric2]
    @rubric3 = params[:rubric3]
    @rubric4 = params[:rubric4]
    @rubric5 = params[:rubric5]
  end

  def insert_course_evaluation
    if external_course_evaluation_service.where(evaluation_where_params).size == 0
      eval = external_course_evaluation_service.create(course_evaluation_params)
      course = external_course_service.find(course_evaluation_params[:course_id])
      course.eval_sum += evaluation_sum_total.to_i
      course.eval_amount += 1
      course.save
      return eval
    else
      return false
    end
  end

  private
  attr_reader :course_id, :user_id, :rubric1, :rubric2, :rubric3 , :rubric4, :rubric5

  def external_course_service
    Course
  end

  def external_course_evaluation_service
    CourseEvaluation
  end

  def evaluation_sum_total
    return (rubric1.to_i * 2 )+ (rubric2.to_i * 2)+ (rubric3.to_i * 2 )+ (rubric4.to_i * 2)+ (rubric5.to_i * 2)
  end

  def course_evaluation_params
    {
        course_id:course_id, user_id: user_id, rubric1: rubric1, rubric2: rubric2, rubric3: rubric3,
        rubric4: rubric4, rubric5: rubric5
    }
  end

  def evaluation_where_params
    {
        course_id: course_id, user_id: user_id
    }
  end
end