class CreateTurnos < ActiveRecord::Migration
  def change
    create_table :turnos do |t|
      t.string :title
      t.time :hora
      t.time :tolerance
      t.integer :type
      t.integer :orange

      t.timestamps
    end
  end
end
