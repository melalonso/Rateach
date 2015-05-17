class TeacherService
  def initialize(params)
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

  def teacher_with_comments
    puts "ESTO ES UN MSJ DESDE EL SERVICIO"
    teachers = external_teacher_service.find(teacher_id_attribute[:id])
    teachers.teacher_comments.each do |comment|
      comment.add_attrs(user_name: User.find(comment.user_id).name)
    end
    puts teachers
    return teachers

  end

  private

  attr_reader :name, :last_name, :faculty_id, :university_id, :id

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
    {
        id: id
    }
  end
end