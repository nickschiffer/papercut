class Book < ApplicationRecord
	belongs_to :post
	mount_uploader :image, ImageUploader
	#searchkick word_middle: [:title, :author, :ISBN]

	def make_visible
		self.update(visibility: true)
	end

	def make_invisible
		self.update(visibility: false)
	end


end
