class Book < ApplicationRecord
	belongs_to :post
	mount_uploader :image, ImageUploader
	searchkick word_middle: [:title, :author, :ISBN]


end
