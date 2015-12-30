class Post < ActiveRecord::Base
	belongs_to :user
	validates :file_name, presence: true
	validates :title, presence: true
	validates :header, presence: true
	validates :content, presence: true

	mount_uploader :file_name, PhotoUploader
end
