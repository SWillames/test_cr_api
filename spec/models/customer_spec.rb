require 'rails_helper'

RSpec.describe Customer, type: :model do
  context 'relationships' do
    it { is_expected.to have_many :carts }
  end

  context '#name' do
    let(:cust) { Customer.new(name: 'sergio willames') }

    it 'titleize name' do
      expect(cust.name).to eq('Sergio Willames')
    end
  end
end
