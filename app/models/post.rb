class Post < ActiveRecord::Base
	belongs_to :user
	has_many :comments, dependent: :destroy , counter_cache: true

	validates :file_name, presence: true
	validates :title, presence: true
	validates :header, presence: true
	validates :content, presence: true

	mount_uploader :file_name, PhotoUploader

end
