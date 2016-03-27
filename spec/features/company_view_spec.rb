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
end

