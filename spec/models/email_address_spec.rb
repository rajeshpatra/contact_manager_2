require 'rails_helper'

RSpec.describe EmailAddress, type: :model do
  let(:eamil_address) do
  	EmailAddress.new
  end

  it 'is valid' do
  	expect(email_address).to be_valid
  end
end
