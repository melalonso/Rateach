class TeachersController < ApplicationController
  before_action :set_teacher, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
  @teachers = Teacher.where(university_id: params[:uid])
  respond_with(@teachers)
  end

  def show
    @teacher = get_teachers_with_comments
    respond_with(@teacher)
  end

  def new
    @teacher = Teacher.new
    respond_with(@teacher)
  end

  def edit
  end

  def create
    @teacher = Teacher.new(teacher_params)
    @teacher.university_id = params[:uid]
    @teacher.save
    respond_with(@teacher)
  end

  def update
    @teacher.update(teacher_params)
    respond_with(@teacher)
  end

  def destroy
    @teacher.destroy
    respond_with(@teacher)
  end

  private
    def set_teacher
      @teacher = Teacher.find(params[:id])
    end

    def get_teachers_with_comments
      TeacherService.new({
                             teacher_id: params[:id], name: params[:name], last_name: params[:last_name],
                             faculty_id: params[:faculty_id] , university_id: params[:university_id]
                         }).teacher_with_comments
    end
    def teacher_params
      params.require(:teacher).permit(:name, :last_name, :eval_amount, :eval_sum)
    end
end
