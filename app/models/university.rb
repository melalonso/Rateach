class University < ActiveRecord::Base
  has_many :faculties, dependent: :destroy
  has_many :careers, through:  :faculties
  has_many :teachers
end
