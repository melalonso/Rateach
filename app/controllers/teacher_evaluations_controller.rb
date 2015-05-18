class TeacherEvaluationsController < ApplicationController

  def new
    render layout: false
  end


  def show
    @teacher_evaluations = get_evaluations_from_teacher
  end

  def create
    teacher_evaluation = create_with_teacher_evaluation_service
    puts teacher_evaluation
    render json: teacher_evaluation
  end

  private

  def create_with_teacher_evaluation_service
    TeacherEvaluationService.new(service_teacher_evaluation_params).insert_teacher_evaluation
  end

  def get_evaluations_from_teacher
    TeacherEvaluationService.new(params[:id]).get_teacher_evaluations
  end

  def teacher_evaluation_params
    params.require(:teacher_evaluation).permit(:teacher_id, :rubric1, :rubric2, :rubric3,
    :rubric4, :rubric5, :rubric6, :rubric7, :rubric8, :rubric9, :rubric10)
  end

  def service_teacher_evaluation_params
    {
        teacher_id: params[:teacher_id], user_id: current_user.id, rubric1: params[:rubric1], rubric2: params[:rubric2],
        rubric3: params[:rubric3], rubric4: params[:rubric4], rubric5: params[:rubric5], rubric6: params[:rubric6],
        rubric7: params[:rubric7], rubric8: params[:rubric8], rubric9: params[:rubric9], rubric10: params[:rubric10]
    }
  end

end