class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :socios
  has_many :likes

  def likes?(socio)
    likes.where(socio_id: socio.id).exists?
  end
  
  mount_uploader :avatar, AvatarUploader

  validates :name, :dob, :gender, presence: true


  private
end
