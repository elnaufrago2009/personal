class CreateCenterWorks < ActiveRecord::Migration
  def change
    create_table :center_works do |t|
      t.string :name
      t.integer :deparment_id

      t.timestamps
    end
  end
end
