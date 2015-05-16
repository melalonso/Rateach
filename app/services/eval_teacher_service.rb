require 'stripe'
class EvalTeacherService
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

  def insert_eval_teacher
    begin
      external_eval_teacher_service.create(eval_teacher_attributes)
      teacher = external_teacher_service.find(eval_teacher_id_attribute)
      teacher.amount_eval+=1
      teacher.sum_eval+=eval_teacher_total
      teacher.save
    rescue
      false
    end
  end

  def delete_eval_teacher
    begin
      external_eval_teacher_service.find(eval_teacher_attributes).destroy
    rescue
      false
    end
  end

  private

  attr_reader :user_id, :teacher_id, :rubric1, :rubric2, :rubric3, :rubric4,
              :rubric5, :rubric6, :rubric7, :rubric8, :rubric9, :rubric10

  def external_eval_teacher_service
    Stripe::EvalTeacher
  end

  def external_teacher_service
    Stripe::Teacher
  end

  def eval_teacher_total
    return @rubric1 +@rubric2 +@rubric3 +@rubric4 +@rubric5 +@rubric6 +@rubric7 +@rubric8 +@rubric9 +@rubric10
  end

  def eval_teacher_attributes
    {
        user_id: user_id, teacher_id: teacher_id, rubric1: rubric1, rubric2: rubric2,
        rubric3: rubric3, rubric4: rubric4, rubric5: rubric5, rubric6: rubric6,
        rubric7: rubric7, rubric8: rubric8, rubric9: rubric9, rubric10: rubric10
    }
  end

  def eval_teacher_id_attribute
    {
        id: teacher_id
    }
  end
end