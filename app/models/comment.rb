class Comment < ApplicationRecord
	belongs_to :user 
	belongs_to :commentable , polymorphic: true
	has_many :comments , as: :commentable, dependent: :destroy
	validates :user_id, presence: true
  	validates :body, presence: true, length: { maximum: 140 }
  	# has_many :replies, class_name: "Comment", as: :commentable, dependent: :destroy
end