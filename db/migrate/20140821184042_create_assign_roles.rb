class CreateAssignRoles < ActiveRecord::Migration
  def change
    create_table :assign_roles do |t|
      t.string :nombre

      t.timestamps
    end
  end
end
