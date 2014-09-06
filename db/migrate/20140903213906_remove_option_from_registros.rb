class RemoveOptionFromRegistros < ActiveRecord::Migration
  def change
    remove_column :registros, :option, :integer
  end
end
