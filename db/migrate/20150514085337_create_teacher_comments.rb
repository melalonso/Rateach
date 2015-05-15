class CreateTeacherComments < ActiveRecord::Migration
  def change
    create_table :teacher_comments do |t|
      t.belongs_to :teacher , index: true
      t.belongs_to :user , index: true
      t.text :content

      t.timestamps
      t.foreign_key (:teachers)
      t.foreign_key (:users)
    end
  end
end
