class User < ApplicationRecord
  attr_accessor :login
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable, :trackable, :timeoutable,
         :lockable

  has_attached_file :avatar, styles: { medium: '300x300>', thumb: '100x100>' },
                    default_url: '/missing.png'
  validates_attachment_content_type :avatar, content_type: %r{\Aimage\/.*\z}

  def login=(login) #ユーザーnameでもログイン/signupできるようにloginを定義
    @login = login
  end

  def login #ユーザーnameでもログイン/signupできるようにloginを定義
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
