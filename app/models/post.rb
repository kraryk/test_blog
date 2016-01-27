class Post < ActiveRecord::Base
	has_and_belongs_to_many :tags
	has_many :comments, dependent: :destroy
	validates :title, presence: true, length: { minimum: 5 }

	mount_uploader :picture, PictureUploader

	def present_tags
		return self.tags.map(&:name).join(", ")
	end

	def assign_tags(tags)
		self.tags << tags
	end
  end
