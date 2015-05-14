class CreateTeacherComments < ActiveRecord::Migration
  def change
    create_table :teacher_comments do |t|
      t.belongs_to :teacher
      t.text :content

      t.timestamps

      t.foreign_key (:teachers)
    end
  end
end
