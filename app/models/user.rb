class User < ActiveRecord::Base
	VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
	GENDER_TYPES = ["None","Male", "Female"]
	PAINTS_COUNT_MAX = 3

	has_many :paints

	before_save { self.email = email.downcase }
	
	validates :name,  presence: true, length: { maximum: 50 }
	validates :email, presence: true, length: { maximum: 255 }, 
		format: { with: VALID_EMAIL_REGEX }, uniqueness: { case_sensitive: false }
	validates :sex, presence: true
	validates :password, length: { minimum: 6 }, allow_nil: true
	validate do 
		check_paints_count
	end
	accepts_nested_attributes_for :paints, allow_destroy: true 
	has_secure_password

	has_attached_file :avatar, :styles => { thumb: "100x100>", :small => "150x150>" },
		:url  => "/assets/avatars/:id/:style/:basename.:extension",
		:path => ":rails_root/public/assets/avatars/:id/:style/:basename.:extension"	
	validates_attachment_content_type :avatar, :content_type => ['image/jpeg', 'image/png']

	private

		def paints_count_valid?
			paints.count <= PAINTS_COUNT_MAX
		end

		def check_paints_count
			unless paints_count_valid?
				errors.add(:base, :paints_count_exceeds_allowed, :count_max => PAINTS_COUNT_MAX)
			end
		end
end
