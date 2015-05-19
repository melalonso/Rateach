class CoursesController < ApplicationController
  before_action :set_course, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @courses = Faculty.find(params[:faculty_id]).courses
    respond_with(@courses)
  end

  def show
    @course = get_course_with_comments_service
    if (user_signed_in?)
      @course.add_attrs(evaluated: course_evaluated_by_user?)
    end
    respond_with(@course)
  end

  def new
    @faculties = fac
    @course = Course.new
    respond_with(@course)
  end

  def edit
  end

  def create
    @course = Course.new(course_params)
    @course.save
    redirect_to root_path
    # respond_with(@course)
  end

  def update
    @course.update(course_params)
    respond_with(@course)
  end

  def destroy
    @course.destroy
    respond_with(@course)
  end

  private

  def course_params
    params.require(:course).permit(:faculty_id,:eval_sum,:eval_amount,:name)
  end

    def set_course
      @course = Course.find(params[:id])
    end
    def get_course_with_comments_service
      CourseService.new({
                        course_id: params[:id]
                        }).get_course_with_comments
    end

    def course_evaluated_by_user?
      CourseService.new({
                            user_id: current_user.id, course_id: params[:id]
                        }).course_evaluated_for_user?
    end
    def create_with_course_evaluation_service
      CourseEvaluationService.new(params).insert_course_evaluation
    end
end
