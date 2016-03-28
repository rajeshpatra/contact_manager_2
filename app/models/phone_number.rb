class PhoneNumber < ActiveRecord::Base
	validates :number, :contact_id, :contact_type, presence: true
	# belongs_to :person
	# :person changed to contact
	belongs_to :contact, polymorphic: true
	# belongs_to :company
end
