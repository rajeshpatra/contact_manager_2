require 'rails_helper'

describe 'the person view', type: :feature do
	let(:person) { Person.create(first_name: 'John', last_name: 'Doe')}

	before(:each) do
		person.phone_numbers.create(number: '1234567890')
		person.phone_numbers.create(number: '1234567899')
		visit person_path(person)
	end

	it 'shows the phone numbers' do
		person.phone_numbers.each do |phone|
			expect(page).to have_content(phone.number)
		end
	end

	it 'has a link to add a new phone number' do
  		expect(page).to have_link('Add phone number', href: new_phone_number_path(person_id: person.id))
  	end

  	it 'adds a new number' do
  		page.click_link('Add phone number')
  		page.fill_in('Number', with: '1234567890')
  		page.click_button('Create Phone number')
  		expect(current_path).to eq(person_path(person))
  		expect(page).to have_content('1234567890')
  	end
end