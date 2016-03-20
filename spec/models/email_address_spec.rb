require 'rails_helper'

RSpec.describe EmailAddress, type: :model do
  let(:email_address) do
  	EmailAddress.new(address: 'you@email.com', person_id: 1)
  end

  it 'is valid' do
  	expect(email_address).to be_valid
  end
end
