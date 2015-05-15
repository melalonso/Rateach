class TeacherComment < ActiveRecord::Base
  belongs_to :teacher
  belongs_to :user
end
