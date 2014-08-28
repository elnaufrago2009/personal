class AddAsignadoToUsers < ActiveRecord::Migration
  def change
    add_column :users, :asignado, :integer, default: 0
  end
end
