require 'rails_helper'

RSpec.describe PhoneNumber, type: :model do
  let(:phone_number) do
  	PhoneNumber.new(number:'1234567890', person_id: 1)
  end

  it 'is valid' do
  	expect(phone_number).to be_valid
  end

  # Phone number can't be blank
  it 'is invalid without a number' do
  	phone_number.number = nil
  	expect(phone_number).not_to be_valid
  end

  it 'must have a reference to a person' do
  	phone_number.person_id = nil
  	expect(phone_number).not_to be_valid
  end
end
