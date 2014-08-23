class CreateInicios < ActiveRecord::Migration
  def change
    create_table :inicios do |t|
      t.string :nombre

      t.timestamps
    end
  end
end
