class RemoveMensajeFromRegistros < ActiveRecord::Migration
  def change
    remove_column :registros, :user_mensaje, :text
    remove_column :registros, :admin_mensaje, :text
  end
end
