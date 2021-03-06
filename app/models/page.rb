class Page < ApplicationRecord

	belongs_to :subject, {:optional => true}
	has_many :sections
	has_and_belongs_to_many :admin_users

	
	scope :visible, lambda { where(:visible => true)}
	scope :invisible, lambda{ where(:visible => false)}
	scope :sorted, lambda { order("position ASC")}
	scope :newest_first, lambda {order("created_at DESC")}
	scope :search, lambda {|query| where(["name LIKE ?", "%#{query}%"])}

	validates_presence_of :name
	validates_length_of :name, :maximum => 255
	#validates_presence_of :permalink
	#validates_length_of :permalink, :maximum => 255

	#validates_uniqueness_of :permalink
	
end
