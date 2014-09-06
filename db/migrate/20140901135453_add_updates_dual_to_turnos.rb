class AddUpdatesDualToTurnos < ActiveRecord::Migration
  def change
    add_column :turnos, :hora_entrada, :time
    add_column :turnos, :hora_salida, :time
  end
end
