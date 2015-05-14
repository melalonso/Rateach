class Course < ActiveRecord::Base
  has_many :eval_courses, dependent: :destroy
end
