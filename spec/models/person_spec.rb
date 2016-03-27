require 'rails_helper'

RSpec.describe Person, type: :model do

	let(:person) do
		Person.new(first_name: 'Alice', last_name: 'Smith')
	end

  it 'is valid'	do
  	expect(person).to be_valid
  end

  it 'is invalid without a first name' do
  	# person = Person.new(first_name: nil)
  	person.first_name = nil
  	expect(person).not_to be_valid
  end

  it 'is invalid without a last name' do
  	# person = Person.new(first_name: 'Bob', last_name: nil)
  	person.last_name = nil
  	expect(person).not_to be_valid
  end

  # check that person is capable of having phone numbers
  # it 'has an array of phone numbers' do
  # 	expect(person.phone_numbers).to eq([])
  # end

  # below is replaced for 'has an array of phone numbers'
  it 'responds with its created phone numbers' do
    person.phone_numbers.build(number: '555-8888')
    expect(person.phone_numbers.map(&:number)).to eq(['555-8888'])
  end

  # for 'has an array of email address'
  it 'responds with its created email address' do
    person.email_addresses.build(address: 'me@example.com')
    expect(person.email_addresses.map(&:address)).to eq(['me@example.com'])
  end
end
