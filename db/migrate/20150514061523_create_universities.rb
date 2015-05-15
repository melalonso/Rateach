class CreateUniversities < ActiveRecord::Migration
  def change
    create_table :universities do |t|
      t.string :name
      t.text :description
      t.string :logo
      t.timestamps
    end
  end
end
