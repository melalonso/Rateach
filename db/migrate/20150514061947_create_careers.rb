class CreateCareers < ActiveRecord::Migration
  def change
    create_table :careers do |t|
      t.belongs_to :faculty , index: true
      t.belongs_to :university , index: true
      t.string :name

      t.timestamps

      t.foreign_key (:faculties)
      t.foreign_key (:universities)
    end
  end
end
