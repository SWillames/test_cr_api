require 'rails_helper'

RSpec.describe Medicine, type: :model do
  let(:valid_attributes) { { name: 'Aspirina', value: 10.0, quantity: 1, stock: 10 } }
  subject { Medicine.new(valid_attributes) }
  
  context 'validations' do
    it { should validate_presence_of :name }
    it { should validate_presence_of :value }
    it { should validate_presence_of :quantity }
    it { should validate_presence_of :stock }

    it { should validate_numericality_of(:value).is_greater_than(0) }
    it { should validate_numericality_of(:stock).only_integer.is_greater_than_or_equal_to(0) }
    it { should validate_numericality_of(:quantity).only_integer.is_greater_than_or_equal_to(0) }
  end
  
  context '#total' do
    it 'multiplies' do
      expect(subject.total).to eql 10.0
    end
  end
end
