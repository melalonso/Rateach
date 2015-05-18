class CourseComment < ActiveRecord::Base
  belongs_to :course
  belongs_to :user

  def add_attrs(attrs)
    attrs.each do |var, value|
      class_eval { attr_accessor var }
      instance_variable_set "@#{var}", value
    end
  end
end