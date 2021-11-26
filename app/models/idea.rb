class Idea < ApplicationRecord
  belongs_to :genre, optional: true
  belongs_to :user

  has_many :favorites, dependent: :destroy

  attachment :image

	def favorited_by?(user)
		favorites.where(user_id: user.id).exists?
	end

  validates :idea, presence: true
	validates :body, presence: true, length: {maximum: 200}
	validates :url, presence: true
end
