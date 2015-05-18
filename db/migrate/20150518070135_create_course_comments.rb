class CreateCourseComments < ActiveRecord::Migration
  def change
    create_table :course_comments do |t|
      t.belongs_to :course , index: true
      t.belongs_to :user , index: true
      t.text :content

      t.timestamps
      t.foreign_key (:courses)
      t.foreign_key (:users)
    end
  end
end
