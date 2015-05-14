class CreateCareers < ActiveRecord::Migration
  def change
    create_table :careers do |t|
      t.belongs_to :faculty
      t.belongs_to :university
      t.string :name

      t.timestamps
    end
  end
end
