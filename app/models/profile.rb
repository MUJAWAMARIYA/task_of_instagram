class Profile < ApplicationRecord
  belongs_to :user
  mount_uploader :image, ImageUploader
  validates :image, :user_id, presence: true
end
