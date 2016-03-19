require 'rails_helper'

RSpec.describe PhoneNumber, type: :model do
  let(:phone_number) {PhoneNumber.new}

  it 'is valid' do
  	expect(phone_number).to be_valid
  end

  # Phone number can't be blank
  it 'is invalid without a number' do
  	phone_number.number = nil
  	expect(phone_number).not_to be_valid
  end


end
