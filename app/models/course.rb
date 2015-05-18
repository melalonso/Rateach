class Course < ActiveRecord::Base
  has_many :course_evaluations, dependent: :destroy
  has_many :course_comments, dependent: :destroy
  belongs_to :university
  belongs_to :career
  def add_attrs(attrs)
    attrs.each do |var, value|
      class_eval { attr_accessor var }
      instance_variable_set "@#{var}", value
    end
  end
end
