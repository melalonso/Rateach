class Faculty < ActiveRecord::Base
  has_many :careers, dependent: :destroy
  belongs_to :university
  #validates :university, presence: true
end
