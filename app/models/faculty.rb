class Faculty < ActiveRecord::Base
  belongs_to :university
  has_many :careers , dependent: :destroy
  #validates :university, presence: true
end
