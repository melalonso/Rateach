class CreateEvalCourses < ActiveRecord::Migration
  def change
    create_table :eval_courses do |t|
      t.belongs_to :course , index: true
      t.belongs_to :user , index: true
      t.integer :rubric1
      t.integer :rubric2
      t.integer :rubric3
      t.integer :rubric4
      t.integer :rubric5

      t.timestamps

      t.foreign_key (:users)
      t.foreign_key (:courses)
    end
  end
end
