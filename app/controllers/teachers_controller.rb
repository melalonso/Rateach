class TeachersController < ApplicationController
  before_action :set_teacher, only: [:show, :edit, :update, :destroy]

  respond_to :html
  respond_to :json

  def index
    teachers2 = Faculty.find(params[:faculty_id]).teachers
    @teachers=[]
    teachers2.each do |teacher|
      if (teacher.state == "accepted")
        @teachers.push(teacher)
      end
    end
    respond_with(@teachers)
  end

  def show
    @teacher = get_teachers_with_comments
    if user_signed_in?
      evaluated = teacher_evaluated_for_current_user?
      @teacher.add_attrs(evaluated: evaluated)
    end

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
    @teacher.eval_amount = 0
    @teacher.eval_sum = 0.0
    @teacher.save
    redirect_to root_path
    #respond_with(@teacher)
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

    def teacher_evaluated_for_current_user?
      TeacherService.new({teacher_id: params[:id], user_id: current_user.id}).evaluated_for_user?
    end

    def teacher_params
      params.require(:teacher).permit(:name, :last_name, :eval_amount, :eval_sum, :university_id, :faculty_id)
    end

    def filter_if_faculty_service
      TeacherService.new({
                             faculty_id: params[:faculty] , university_id: params[:university_id]
                         }).filter_if_faculty
    end
end
