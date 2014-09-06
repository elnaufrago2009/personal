class RemoveNaranjasFromTurnos < ActiveRecord::Migration
  def change
    remove_column :turnos, :type, :integer
    remove_column :turnos, :orange, :integer
  end
end
