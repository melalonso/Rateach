class Faculty < ActiveRecord::Base
  belongs_to :university
  has_many :careers , dependent: :destroy
  has_many :teachers , dependent: :destroy

  #validates :university, presence: true
end
