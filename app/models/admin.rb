class Admin < ActiveRecord::Base
	belongs_to :user_normal, :class_name => 'User', :foreign_key => 'user_normal_id'
	belongs_to :user_admin, :class_name => 'User', :foreign_key => 'user_admin_id'
end
