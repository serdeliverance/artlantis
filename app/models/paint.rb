class Paint < ActiveRecord::Base
	belongs_to :user

	has_attached_file :paint, :styles => { medium: "300x300>", thumb: "100x100>", :small => "150x150>" },
    	:url  => "/assets/paintings/:id/:style/:basename.:extension",
       	:path => ":rails_root/public/assets/paintings/:id/:style/:basename.:extension"

   	validates_attachment_content_type :paint, :content_type => ['image/jpeg', 'image/png']
end