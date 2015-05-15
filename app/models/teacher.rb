class Teacher < ActiveRecord::Base
  has_many :eval_teachers, dependent: :destroy
  belongs_to :faculty
  belongs_to :university
end
