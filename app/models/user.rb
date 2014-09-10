class User < ActiveRecord::Base
  belongs_to :area
  has_many :user_turnos
  rolify
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  has_and_belongs_to_many :roles, :join_table => :users_roles
  devise :database_authenticatable, :registerable, 
         :recoverable, :rememberable, :trackable, :validatable

  validates_presence_of :first_name, :message => 'No puede estar Vacio.'           
  validates_presence_of :second_name, :message => 'No puede estar Vacio.'
end
