class User < ActiveRecord::Base
	has_many :paints

	before_save { self.email = email.downcase }
	validates :name,  presence: true, length: { maximum: 50 }
	VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
	validates :email, presence: true, length: { maximum: 255 }, 
		format: { with: VALID_EMAIL_REGEX }, uniqueness: { case_sensitive: false }
	validates :sex, presence: true
	validates :password, length: { minimum: 6 }, allow_nil: true
	has_secure_password

	has_attached_file :avatar, :styles => { thumb: "100x100>", :small => "150x150>" },
		:url  => "/assets/avatars/:id/:style/:basename.:extension",
		:path => ":rails_root/public/assets/avatars/:id/:style/:basename.:extension"	
	validates_attachment_content_type :avatar, :content_type => ['image/jpeg', 'image/png']
end
