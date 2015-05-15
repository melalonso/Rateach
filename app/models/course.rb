class Course < ActiveRecord::Base
  has_many :eval_courses, dependent: :destroy
  belongs_to :university
  belongs_to :career
  
end
