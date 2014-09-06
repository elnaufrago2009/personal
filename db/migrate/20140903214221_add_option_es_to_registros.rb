class AddOptionEsToRegistros < ActiveRecord::Migration
  def change
    add_column :registros, :option_entrada, :integer
    add_column :registros, :option_salida, :integer
  end
end
