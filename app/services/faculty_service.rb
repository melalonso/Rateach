
class FacultyService
  def initialize(params)
    @id = params[:id] if params[:id]
    @name = params[:name]
    @university_id[:university_id]
  end

  def create_faculty
    begin
      external_faculty_service.create(faculty_attributes)
    rescue
      false
    end
  end

  def delete_faculty
    begin
      external_faculty_service.find(faculty_id_attribute).destroy
    rescue
      false
    end
  end

  def get_faculties
    begin
      external_faculty_service.all
    rescue
      false
    end
  end

  def get_careers_from_faculty
    external_faculty_service.find(faculty_id_attribute).careers
  end


  private
  attr_reader :name, :university_id, :id
  def external_faculty_service
    Stripe::Faculty
  end

  def faculty_attributes
    {
        name: name, university_id: university_id
    }
  end

  def faculty_id_attribute
    {
        faculty_id: id
    }
  end
end