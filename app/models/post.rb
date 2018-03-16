class Post < ApplicationRecord
	belongs_to :user
	has_many :replies, dependent: :destroy
	extend FriendlyId
	friendly_id :title, use: :slugged

	def should_generate_new_friendly_id?
		title_changed?
	end
end
