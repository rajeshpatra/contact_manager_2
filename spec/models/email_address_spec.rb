require 'rails_helper'

RSpec.describe EmailAddress, type: :model do
  let(:person) {Person.create(first_name: 'Amitabh', last_name: 'Pal')}
  let(:email_address) do
  	EmailAddress.new(address: 'you@email.com', contact_id: person.id, contact_type: 'Person')
  end

  it 'is valid' do
  	expect(email_address).to be_valid
  end

  it 'is invalid without a eamil address' do
  	email_address.address = nil
  	expect(email_address).not_to be_valid
  end

  it 'must have a reference to a person' do
  	email_address.contact_id = nil
  	expect(email_address).not_to be_valid
  end

  it 'is associated with person or contact' do
  	expect(email_address).to respond_to(:contact)
  end
end
