class Picture < ActiveRecord::Base
  belongs_to :user
	has_attached_file :pic, :styles => { :display => "x500", :medium => "300x300#", :thumb => "100x100#" }, :default_url => "/images/:style/missing.png"
  validates_attachment_content_type :pic, :content_type => /\Aimage\/.*\Z/
  validates_with AttachmentSizeValidator, :attributes => :pic, :less_than => 1.megabytes
end

## when date.now is more than 24 hours, delete it. 
