require 'rails_helper'

RSpec.describe PhoneNumber, type: :model do
	let(:person) { Person.create(:first_name => "Jimbob", :last_name => "Billy") }
  let(:phone_number) do
  	PhoneNumber.new(number:'1234567890', contact_id: person.id, contact_type: 'Person')
  end

  it 'is valid' do
  	expect(phone_number).to be_valid
  end

  # Phone number can't be blank
  it 'is invalid without a number' do
  	phone_number.number = nil
  	expect(phone_number).not_to be_valid
  end

  # it 'must have a reference to a person' do
  it 'must have a reference to a contact' do
  	# phone_number.person_id = nil
  	phone_number.contact_id = nil
  	expect(phone_number).not_to be_valid
  end

  # Phone number has a method to give you back the associated Contact object.
  it 'is associated with a contact' do
  	expect(phone_number).to respond_to(:contact)
  end
end
