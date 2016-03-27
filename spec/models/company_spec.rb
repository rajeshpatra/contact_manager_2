require 'rails_helper'

RSpec.describe Company, type: :model do
  let(:company) do
  	Company.new(name: 'MyString')
  end

  it 'is valid' do
  	expect(company).to be_valid
  end

  it 'is invalid without a name' do
  	company.name = nil
  	expect(company).to_not be_valid
  end

  # it 'has an array phone of numbers' do
  # 	expect(company.phone_numbers).to eq ([])
  # end


  # below is replaced with 'has an array of phone numbers'
  it 'responds with its phone number after they\'re created' do
    phone_number = company.phone_numbers.build(number: '333-4444')
    expect(phone_number.number).to eq('333-4444')
  end
end
