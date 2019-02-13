class User < ApplicationRecord
  attr_accessor :login
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable, :trackable, :timeoutable,
         :lockable
  def login=(login)
    @login = login
  end

  def login
    @login || self.name || self.email
  end

  def self.find_for_database_authentication(warden_conditions)
    conditions = warden_conditions.dup
    conditions[:email].downcase! if conditions[:email]
    login = conditions.delete(:login)

    where(conditions.to_hash).where(
      ['lower(name) = :value OR lower(email) = :value',
       { value: login.downcase }]
    ).first
  end
end
