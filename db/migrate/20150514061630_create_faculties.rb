class CreateFaculties < ActiveRecord::Migration
  def change
    create_table :faculties do |t|
      t.belongs_to :university
      t.string :name

      t.timestamps
      t.foreign_key :universities
    end
    #add_foreign_key (:university,  dependent: :delete)
  end
end
