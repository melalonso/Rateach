class CreateCourseComments < ActiveRecord::Migration
  def change
    create_table :course_comments do |t|
      t.belongs_to :course
      t.text :content

      t.timestamps
      t.foreingn_key (:courses, depends: :destroy)
    end
  end
end
