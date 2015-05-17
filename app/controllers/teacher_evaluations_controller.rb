class TeacherEvaluationsController < ApplicationController

  def new
    render layout: false
  end


  def create
    @teacher_evaluation = create_with_teacher_evaluation_service
    respond_with(@teacher_evaluation)
  end

  def show
  @teacher_evaluations = get_evaluations_from_teacher
  end

  def create

  end

  private

  def create_with_teacher_evaluation_service
    TeacherEvaluationService.new(teacher_evaluation_params).create
  end

  def get_evaluations_from_teacher
    TeacherEvaluationService.new(params[:id]).get_teacher_evaluations
  end

  def teacher_evaluation_params
    params.require(:teacher_evaluation).permit(:teacher_id, :rubric1, :rubric2, :rubric3,
    :rubric4, :rubric5, :rubric6, :rubric7, :rubric8, :rubric9, :rubric10)
  end

end