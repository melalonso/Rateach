
class TeacherEvaluationService
  def initialize(params)
    @user_id = params[:user_id]
    @teacher_id = params[:teacher_id]
    @rubric1 = params[:rubric1]
    @rubric2 = params[:rubric2]
    @rubric3 = params[:rubric3]
    @rubric4 = params[:rubric4]
    @rubric5 = params[:rubric5]
    @rubric6 = params[:rubric6]
    @rubric7 = params[:rubric7]
    @rubric8 = params[:rubric8]
    @rubric9 = params[:rubric9]
    @rubric10 = params[:rubric10]
  end

  def insert_teacher_evaluation
      if external_teacher_evaluation_service.where(evaluation_where_params).size == 0
        eval = external_teacher_evaluation_service.create(teacher_evaluation_attributes)
        teacher = external_teacher_service.find(teacher_id_evaluation_attribute)
        teacher.eval_amount+=1
        teacher.eval_sum += teacher_total_evaluation.to_i
        teacher.save
        return eval
      else
        false
      end

  end

  def delete_teacher_evaluation
      external_eval_teacher_service.find(teacher_evaluation_attributes).destroy
  end

  def get_teacher_evaluations
    external_teacher_service.find(teacher_id_evaluation_attribute).teacher_evaluations
  end

  private

  attr_reader :user_id, :teacher_id, :rubric1, :rubric2, :rubric3, :rubric4,
              :rubric5, :rubric6, :rubric7, :rubric8, :rubric9, :rubric10

  def external_teacher_evaluation_service
    TeacherEvaluation
  end

  def external_teacher_service
    Teacher
  end

  def teacher_total_evaluation
    rubric1.to_i + rubric2.to_i + rubric3.to_i + rubric4.to_i + rubric5.to_i + rubric6.to_i + rubric7.to_i + rubric8.to_i + rubric9.to_i + rubric10.to_i
  end

  def teacher_evaluation_attributes
    {
        user_id: user_id, teacher_id: teacher_id, rubric1: rubric1, rubric2: rubric2,
        rubric3: rubric3, rubric4: rubric4, rubric5: rubric5, rubric6: rubric6,
        rubric7: rubric7, rubric8: rubric8, rubric9: rubric9, rubric10: rubric10
    }
  end

  def teacher_id_evaluation_attribute
    teacher_id
  end

  def evaluation_where_params
    {
        teacher_id: teacher_id, user_id: user_id
    }
  end
end