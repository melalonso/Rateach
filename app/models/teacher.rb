class Teacher < ActiveRecord::Base
  has_many :teacher_evaluations, dependent: :destroy
  has_many :teacher_comments, dependent: :destroy
  belongs_to :faculty
  belongs_to :university

  def add_attrs(attrs)
    attrs.each do |var, value|
      class_eval { attr_accessor var }
      instance_variable_set "@#{var}", value
    end
  end
end
