class AddUserToRegistros < ActiveRecord::Migration
  def change
    add_column :registros, :user_id, :integer
  end
end
