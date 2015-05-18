class CourseEvaluationsController < ApplicationController


  def create
    course_evaluation = create_course_evaluation_with_service
    render json: course_evaluation
  end


  def new
    render layout: false
  end
  private

  def create_course_evaluation_with_service
    options = {user_id: current_user.id}
    new_params = params.merge(options)
    CourseEvaluationService.new(new_params).insert_course_evaluation
  end
end
