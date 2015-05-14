class EvalTeacher < ActiveRecord::Base
  belongs_to :teacher, dependent: :destroy
end
