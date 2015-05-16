class Career < ActiveRecord::Base
  belongs_to :faculty
  has_many :courses, dependent: :destroy
end
