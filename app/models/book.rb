class Book < ApplicationRecord
	before_save { self.title = title[0,1].upcase + title[1,title.length]}
  	before_save { self.author = author[0,1].upcase + author[1,author.length]}	
	VALID_TITLE = /\A[a-z ]+\z/i
	VALID_AUTHOR = /\A[a-z ]+\z/i

	validates_presence_of   :title
	validates_presence_of   :author
	validates_presence_of	:ISBN
	validates :title, allow_blank: true, length: { minimum: 2, maximum: 100 }
	validates :author, allow_blank: true, length: { minimum: 2, maximum: 100 }    
	
	belongs_to :post
	mount_uploader :image, ImageUploader
	#searchkick word_middle: [:title, :author, :ISBN]

	def make_visible
		self.update!(visibility: true)
	end

	def make_invisible
		self.update!(visibility: false)
	end


end
