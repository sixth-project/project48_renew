class Post < ApplicationRecord
  belongs_to :user
  has_attached_file :photo, styles: { medium: '300x300>', thumb: '100x100>' }
  validates_attachment_content_type :photo, content_type: ["image/jpeg", "image/png"] #テスト必要
  validates_attachment_size :photo, :less_than=>1.megabyte #テスト必要
  validates :user_id, presence: true #テスト必要
  validates :content, presence: true, length: {maximum: 255} #テスト必要
  validates :title, presence: true #テスト必要
end
