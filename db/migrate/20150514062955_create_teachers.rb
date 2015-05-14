class CreateTeachers < ActiveRecord::Migration
  def change
    create_table :teachers do |t|
      t.belongs_to :university
      t.belongs_to :faculty
      t.string :name
      t.string :last_name
      t.float :sum_eval
      t.integer :cant_eval
      t.timestamps

      t.foreign_key (:faculties, :universities)
    end

  end
end
