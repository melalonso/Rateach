class Course < ActiveRecord::Base
  has_many :course_evaluations, dependent: :destroy
  belongs_to :university
  belongs_to :career

end
