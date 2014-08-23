class AddAsignadoToUsers < ActiveRecord::Migration
  def change
    add_column :users, :asignado, :integer
  end
end
