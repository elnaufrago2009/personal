class AddMensajeEsToRegistros < ActiveRecord::Migration
  def change
    add_column :registros, :entrada_user_mensaje, :text
    add_column :registros, :entrada_admin_mensaje, :text
    add_column :registros, :salida_user_mensaje, :text
    add_column :registros, :salida_admin_mensaje, :text
  end
end
