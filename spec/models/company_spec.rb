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

  # it 'has an array phone numbers' do
  # 	expect(company.phone_numbers).to eq ([])
  # end
end
