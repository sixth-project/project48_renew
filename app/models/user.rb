# == Schema Information
#
# Table name: users
#
#  id                     :bigint(8)        not null, primary key
#  email                  :string(255)      default(""), not null
#  encrypted_password     :string(255)      default(""), not null
#  reset_password_token   :string(255)
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer          default(0), not null
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :string(255)
#  last_sign_in_ip        :string(255)
#  confirmation_token     :string(255)
#  confirmed_at           :datetime
#  confirmation_sent_at   :datetime
#  unconfirmed_email      :string(255)
#  failed_attempts        :integer          default(0), not null
#  unlock_token           :string(255)
#  locked_at              :datetime
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  name                   :string(255)
#  avatar_file_name       :string(255)
#  avatar_content_type    :string(255)
#  avatar_file_size       :bigint(8)
#  avatar_updated_at      :datetime
#  profile                :text(65535)
#

class User < ApplicationRecord

  enum role: { user: 0, admin: 1 } #ユーザーの権限管理・通常のユーザーの場合はデフォルトで0に設定。
  
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable, :trackable, :timeoutable,
         :lockable

  has_attached_file :avatar, styles: { medium: '300x300>', thumb: '100x100>' },#アバターの写真サイズ
                    default_url: '/missing.png'
  validates_attachment_content_type :avatar, content_type: %r{\Aimage\/.*\z}
  validates :profile, length: { maximum: 255 } #プロフィールの文字数制限

  attr_accessor :login

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
