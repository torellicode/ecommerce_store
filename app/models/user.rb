class User < ApplicationRecord
  has_many :products
  
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

   # Constants for roles
   ROLES = %w[standard vendor admin].freeze

   # Validations
   validates :role, inclusion: { in: ROLES }
 
   # Methods to check user roles
   def admin?
     role == 'admin'
   end
 
   def vendor?
     role == 'vendor'
   end
 
   def standard?
     role == 'standard'
   end
end
