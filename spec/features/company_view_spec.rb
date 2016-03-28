require 'rails_helper'

describe 'the company view', type: :feature do
	let(:company) {Company.create(name: 'MyCompany')}

	before(:each) do
		company.phone_numbers.create(number: '1234567890')
		company.phone_numbers.create(number: '1234567899')
		visit company_path(company)
	end

	it 'shows the phone number' do
		company.phone_numbers.each do |phone|
			expect(page).to have_content(phone.number)
		end
	end

	it 'has a link to add new phone number' do
		expect(page).to have_link('Add phone number', href: new_phone_number_path(contact_id: company.id, contact_type: 'Company'))
	end

	it 'adds a new number' do
		page.click_link('Add phone number')
		page.fill_in('Number', with: '1234567890')
		page.click_button('Create Phone number')
		expect(current_path).to eq(company_path(company))
		expect(page).to have_content('1234567890')
	end

	it 'has links to edit phone number' do
		company.phone_numbers.each do |phone|
			expect(page).to have_link('Edit', href: edit_phone_number_path(phone))
		end
	end

	it 'edits a phone number' do
		phone = company.phone_numbers.first
		old_number = phone.number

		first(:link, 'Edit').click
		page.fill_in('Number', with: '1234567890')
		page.click_button('Update Phone number')
		expect(current_path).to eq(company_path(company))
		expect(page).to have_content('1234567890')
		# expect(page).not_to have_content(old_number)
	end

	it 'has links to delete phone number' do
		company.phone_numbers.each do |phone|
			expect(page).to have_link('Delete', href: phone_number_path(phone))
		end
	end

	it 'deletes a phone number' do
		phone = company.phone_numbers.first
		first(:link, 'Delete').click
		expect(current_path).to eq(company_path(company))
	end
end

describe 'the company view', type: :feature do
	let(:company) {Company.create(name: 'MyCompany')}

	before(:each) do
		company.email_addresses.create(address: 'my@mail.com')
		company.email_addresses.create(address: 'your@mail.com')
		visit company_path(company)
	end

	it 'shows the email address' do
		company.email_addresses.each do |email|
			expect(page).to have_content(email.address)
		end
	end

	it 'has a link to add new email address' do
		expect(page).to have_link('Add email address', href: new_email_address_path(contact_id: company.id, contact_type: 'Company'))
	end

	it 'adds a new email address' do
		page.click_link('Add email address')
		page.fill_in('Address', with: 'my@mail.com')
		page.click_button('Create Email address')
		expect(current_path).to eq(company_path(company))
		expect(page).to have_content('my@mail.com')
	end

	it 'has links to edit email address' do
		company.email_addresses.each do |email|
			expect(page).to have_link('edit', href: edit_email_address_path(email))
		end
	end

	it 'edits the email address' do
		email = company.email_addresses.first
		old_address = email.address

		first(:link, 'edit').click
		page.fill_in('Address', with: 'my@mail.com')
		page.click_button('Update Email address')
		expect(current_path).to eq(company_path(company))
		expect(page).to have_content('my@mail.com')
		# expect(page).not_to have_content(old_address)
	end

	it 'has links to delete email address' do
		company.email_addresses.each do |email|
			expect(page).to have_link('delete', href: email_address_path(email))
		end
	end

	it 'deletes the email address' do
		email = company.email_addresses.first
		
		first(:link, 'delete').click
		expect(current_path).to eq(company_path(company))
	end
end