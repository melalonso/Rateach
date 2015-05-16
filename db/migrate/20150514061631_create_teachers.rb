class CreateTeachers < ActiveRecord::Migration
  def change
    create_table :teachers do |t|
      t.belongs_to :university , index: true
      t.belongs_to :faculty , index: true
      t.string :name
      t.string :last_name
      t.float :eval_sum
      t.integer :eval_amount
      t.timestamps
      t.foreign_key (:universities)
      t.foreign_key (:faculties)
    end
  end
end
