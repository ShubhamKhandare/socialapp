class User < ApplicationRecord

  has_many :microposts, dependent: :destroy
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable, :lockable 

  # def send_devise_notification(notification, *args)
  # 	devise_mailer.send(notification, self, *args).deliver_later
  # end

  	def feed
		Micropost.where("user_id = ?", id)
	end
end
