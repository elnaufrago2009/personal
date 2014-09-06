class CreateRegistros < ActiveRecord::Migration
  def change
    create_table :registros do |t|
      t.datetime :fecha_hora
      t.integer :register_turnos
      t.integer :tarde
      t.integer :option
      t.integer :turno_id

      t.timestamps
    end
  end
end
