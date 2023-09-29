class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :socios
  has_many :likes
  has_many :comments



  # Define the relationships
  has_many :active_relationships, class_name: 'Relationship',
                                 foreign_key: 'follower_id',
                                 dependent: :destroy
  has_many :following, through: :active_relationships, source: :followed

  has_many :passive_relationships, class_name: 'Relationship',
                                  foreign_key: 'followed_id',
                                  dependent: :destroy
  has_many :followers, through: :passive_relationships, source: :follower





  def likes?(socio)
    likes.where(socio_id: socio.id).exists?
  end
  
  mount_uploader :avatar, AvatarUploader

  validates :name, :dob, :gender, presence: true


  



    # Follow a user
    def follow(other_user)
      active_relationships.create(followed: other_user)
    end
  
    # Unfollow a user
    def unfollow(other_user)
      active_relationships.find_by(followed: other_user).destroy
    end
  
    # Check if the current user is following another user
    def following?(other_user)
      following.include?(other_user)
    end

    def followers_count
      followers.count
    end
  
    def following_count
      following.count
    end

end
