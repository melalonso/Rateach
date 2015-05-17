class CreateTeacherEvaluations < ActiveRecord::Migration
  def change
    create_table :teacher_evaluations do |t|
      t.belongs_to :teacher  , index: true
      t.belongs_to :user , index: true
      t.integer :rubric1
      t.integer :rubric2
      t.integer :rubric3
      t.integer :rubric4
      t.integer :rubric5
      t.integer :rubric6
      t.integer :rubric7
      t.integer :rubric8
      t.integer :rubric9
      t.integer :rubric10

      t.timestamps

      t.foreign_key (:users)
      t.foreign_key (:teachers)
    end
  end
end
