class AddHoraEsToRegistros < ActiveRecord::Migration
  def change
    add_column :registros, :hora_entrada, :datetime
    add_column :registros, :hora_salida, :datetime
  end
end
