class University < ActiveRecord::Base
  has_many :teachers , dependent: :destroy
  has_many :courses, -> { readonly }, through: :careers , dependent: :destroy
  has_many :careers, -> { readonly }, through:  :faculties, dependent: :destroy
  has_many :faculties, dependent: :destroy
end
