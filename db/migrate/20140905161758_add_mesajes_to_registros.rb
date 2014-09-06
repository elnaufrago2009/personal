class AddMesajesToRegistros < ActiveRecord::Migration
  def change
    add_column :registros, :user_mensaje, :text
    add_column :registros, :admin_mensaje, :text
  end
end
