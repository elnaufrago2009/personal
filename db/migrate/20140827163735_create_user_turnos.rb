class CreateUserTurnos < ActiveRecord::Migration
  def change
    create_table :user_turnos do |t|
      t.integer :user_id
      t.integer :turno_id

      t.timestamps
    end
  end
end
