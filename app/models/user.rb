class User < ApplicationRecord

  has_many :microposts, dependent: :destroy
  has_many :active_relationships, class_name:  "Relationship", foreign_key: "follower_id", dependent:   :destroy
  has_many :passive_relationships, class_name:  "Relationship",foreign_key: "followed_id", dependent:   :destroy
  has_many :following, through: :active_relationships, source: :followed
  has_many :followers, through: :passive_relationships, source: :follower
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable, :lockable 

  # def send_devise_notification(notification, *args)
  # 	devise_mailer.send(notification, self, *args).deliver_later
  # end

  def feed
		# Micropost.where("user_id = ?", id)
    # Micropost.where("user_id IN (?) OR user_id = ?", following_ids, id)
    following_ids = "SELECT followed_id FROM relationships
                     WHERE  follower_id = :user_id"
    Micropost.where("user_id IN (#{following_ids})
                     OR user_id = :user_id", user_id: id)
	end

  # Follows a user.
  def follow(other_user)
    following << other_user
  end

  # Unfollows a user.
  def   unfollow(other_user)
    following.delete(other_user)
  end

  def following?(other_user)
    following.include?(other_user)
  end
end
