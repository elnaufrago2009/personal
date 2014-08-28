class AddFieldsToUsers < ActiveRecord::Migration
  def change
    add_column :users, :first_name, :string
    add_column :users, :second_name, :string
    add_column :users, :mac, :string
    add_column :users, :area_id, :integer
  end
end
