class CreateAdmins < ActiveRecord::Migration
  def change
    create_table :admins do |t|
      t.string :nombre
      t.integer :user_normal_id
      t.integer :user_admin_id

      t.timestamps
    end
  end
end
