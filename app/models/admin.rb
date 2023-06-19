class Admin < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, authentication_keys: [:email]

  def self.find_for_database_authentication(warden_conditions)
    email = warden_conditions[:email].to_s.downcase.strip
    find_by(email: email)
  end
end
