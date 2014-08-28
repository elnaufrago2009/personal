class CreateDeparments < ActiveRecord::Migration
  def change
    create_table :deparments do |t|
      t.string :name

      t.timestamps
    end
  end
end
