class Post < ApplicationRecord
  belongs_to :user
  validates :user_id, presence: true #テスト必要
  validates :content, presence: true, length: {maximum: 255} #テスト必要
  validates :title, presence: true
end
