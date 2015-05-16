class CreateCourses < ActiveRecord::Migration
  def change
    create_table :courses do |t|
      t.belongs_to :career , index: true
      t.belongs_to :university , index: true
      t.belongs_to :faculty , index: true
      t.string :name , index: true
      t.float :sum_eval , index: true
      t.integer :cant_eval , index: true

      t.timestamps

      t.foreign_key (:careers)
      t.foreign_key (:universities)
      t.foreign_key (:faculties)

    end
  end
end
