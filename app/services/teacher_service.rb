class TeacherService
  def initialize(params)
    @user_id = params[:user_id]
    @id = params[:teacher_id]
    @name = params[:name]
    @last_name = params[:last_name]
    @faculty_id = params[:faculty_id]
    @university_id = params[:university_id]
  end

  def create_teacher
    begin
      external_teacher_service.create(teacher_attributes)
    rescue
      false
    end
  end

  def delete_teacher
    begin
      external_teacher_service.find(teacher_id_attribute).destroy
    rescue
      false
    end
  end

  def update_teacher
    begin
      external_teacher_service.find(teacher_id_attribute).update_attributes(teacher_attributes)
    rescue
      false
    end
  end

  def filter_if_faculty
      if (teacher_faculty_attribute != nil)
        external_teacher_service.where(evaluation_where_faculty)
      else
        external_teacher_service.where(evaluation_where_uid)
      end
  end

  def teacher_with_comments
    puts "ESTO ES UN MSJ DESDE EL SERVICIO"
    teachers = external_teacher_service.find(teacher_id_attribute)
    teachers.teacher_comments.each do |comment|
      comment.add_attrs(user_name: User.find(comment.user_id).name)
    end
    puts teachers
    return teachers

  end

  def evaluated_for_user?
    evaluations = external_eval_teacher_service.where(evaluation_where_params)
    return evaluations.size == 0
  end
  private

  attr_reader :name, :last_name, :faculty_id, :university_id, :id, :user_id

  def external_teacher_service
    Teacher
  end

  def external_eval_teacher_service
    TeacherEvaluation
  end

  def teacher_attributes
    {
        name: name, last_name: last_name, faculty_id: faculty_id, university_id: university_id
    }
  end

  def teacher_id_attribute
    id
  end

  def teacher_faculty_attribute
    faculty_id
  end


  def evaluation_where_params
    {
        teacher_id: id, user_id: user_id
    }
  end

  def evaluation_where_uid
    {
        university_id: university_id
    }
  end

  def evaluation_where_faculty
    {
        university_id: university_id,faculty_id: faculty_id
    }
  end
end