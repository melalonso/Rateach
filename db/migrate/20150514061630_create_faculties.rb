class CreateFaculties < ActiveRecord::Migration
  def change
    create_table :faculties do |t|
      t.belongs_to :university , index: true
      t.string :name

      t.timestamps
      t.foreign_key (:universities)
    end
  end
end