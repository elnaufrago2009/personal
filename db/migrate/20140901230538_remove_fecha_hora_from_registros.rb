class RemoveFechaHoraFromRegistros < ActiveRecord::Migration
  def change
    remove_column :registros, :fecha_hora, :datetime
  end
end
