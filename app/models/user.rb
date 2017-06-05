class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

	has_many :posts, dependent: :destroy

	mount_uploader :avatar, AvatarUploader

	validates :first_name, presence: true
	validates :last_name, presence: true
# 	validates :avatar, presence: true
	
	
    before_save :default_values
    
    def default_values
        self.avatar  = open("public/default.png")
    end


end
