class Teacher < ActiveRecord::Base
  has_many :teacher_evaluations, dependent: :destroy
  belongs_to :faculty
  belongs_to :university
end
