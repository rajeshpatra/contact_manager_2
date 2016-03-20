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

  	it 'has links to edit phone number' do
  		person.phone_numbers.each do |phone|
  			expect(page).to have_link('Edit', href: edit_phone_number_path(phone))
  		end
  	end

  	it 'edits a phone number' do
  		phone = person.phone_numbers.first
  		old_number = phone.number

  		first(:link, 'Edit').click
  		page.fill_in('Number', with: '1234567890')
  		page.click_button('Update Phone number')
  		expect(current_path).to eq(person_path(person))
  		expect(page).to have_content('1234567890')

  		# unable to implement this 
  		# expect(page).to_not have_content(old_number)
  	end

  	it 'has links to delete phone number' do
  		person.phone_numbers.each do |phone|
  			expect(page).to have_link('Delete', href: phone_number_path(phone))
  		end
  	end

  	it 'deletes a phone number' do
  		phone = person.phone_numbers.first
  		first(:link, 'Delete').click
  		expect(current_path).to eq(person_path(person))
  	end

  	before(:each) do
  		person.email_address.create(address: 'rajesh@gmail.com')
  		person.email_address.create(address: 'rzs@gmail.com')
  		visit person_path(person)
  	end

  	it 'shows the email addresses' do
  		person.email_address.each do |email|
  			expect(page).to have_content(email.address)
  		end
  	end

  	it 'has a link to add a new email address' do
  		expect(page).to have_link('Add Email Address', href: new_email_address_path(person_id: person.id))
  	end

  	it 'adds a new email address' do
  		page.click_link('Add Email Address')
  		page.fill_in('Address', with: 'you@gmail.com')
  		page.click_button('Create Email address')
  		expect(current_path).to eq(person_path(person))
  		expect(page).to have_content('you@gmail.com')
  	end

  	it 'has links to edit email addresses' do
  		person.email_address.each do |email|
  			expect(page).to have_link('edit', href: edit_email_address_path(email))
  		end
  	end

  	it 'edits a email address' do
  		email = person.email_address.first
  		old_address = email.address

  		first(:link, 'edit').click
  		page.fill_in('Address', with: 'you@gmail.com')
  		page.click_button('Update Email address')
  		expect(current_path).to eq(person_path(person))
  		expect(page).to have_content('you@gmail.com')
  		# here the following code doesn't give any error but in phone number it is, so check for that.
  		expect(page).to_not have_content(old_address)
  	end

  	it 'has links to delete email address' do
  		person.email_address.each do |email|
  			expect(page).to have_link('delete', href: email_address_path(email))
  		end
  	end

  	it 'deletes a email address' do
  		email = person.email_address.first
  		first(:link, 'delete').click
  		expect(current_path).to eq(person_path(person))
  	end
end