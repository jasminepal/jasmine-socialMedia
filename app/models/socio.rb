class Socio < ApplicationRecord
    belongs_to :user
    mount_uploader :image, ImageUploader
    mount_uploader :video, VideoUploader
    has_many :likes
    has_many :comments
    validates :title, :description, presence: true
end
