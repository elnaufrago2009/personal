class RemoveHoraFromTurnos < ActiveRecord::Migration
  def change
    remove_column :turnos, :hora, :time
  end
end
