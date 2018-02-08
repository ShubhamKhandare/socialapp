class User < ApplicationRecord

  has_many :microposts, dependent: :destroy
  has_many :active_relationships, class_name:  "Relationship", foreign_key: "follower_id", dependent:   :destroy
  has_many :passive_relationships, class_name:  "Relationship",foreign_key: "followed_id", dependent:   :destroy
  has_many :following, through: :active_relationships, source: :followed
  has_many :followers, through: :passive_relationships, source: :follower
  has_many :hearts, dependent: :destroy
  has_many :messages
  has_many :conversations, foreign_key: :sender_id
  has_many :comments, dependent: :destroy
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable, :lockable 

  # def send_devise_notification(notification, *args)
  # 	devise_mailer.send(notification, self, *args).deliver_later
  # end
  has_attached_file :avatar, styles: { medium: "300x300>", thumb: "80x80>" }, default_url: "https://secure.gravatar.com/avatar/s=60/d=identicon"
  validates_attachment_content_type :avatar, :content_type =>  ["image/jpg", "image/jpeg", "image/png", "image/gif"]

  def feed
		# Micromicropost.where("user_id = ?", id)
    # Micromicropost.where("user_id IN (?) OR user_id = ?", following_ids, id)
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
  def unfollow(other_user)
    following.delete(other_user)
  end

  def following?(other_user)
    following.include?(other_user)
  end

  # creates a new heart row with micropost_id and user_id
  def heart!(micropost)
    self.hearts.create!(micropost_id: micropost.id)
  end

  # destroys a heart with matching micropost_id and user_id
  def unheart!(micropost)
    heart = self.hearts.find_by_micropost_id(micropost.id)
    heart.destroy!
  end

  # returns true of false if a micropost is hearted by user
  def heart?(micropost)
    !!self.hearts.find_by_micropost_id(micropost.id)
  end


end
