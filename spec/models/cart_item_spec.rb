require 'rails_helper'

RSpec.describe CartItem, type: :model do
  context 'relationships' do
    it { is_expected.to belong_to :cart }
    it { is_expected.to belong_to :medicine }
  end

  context '#adding to cart' do
    before(:each) do
      Customer.new(name: 'customer test').save
      Cart.new(customer_id: Customer.last.id).save
      Medicine.new(name: 'Piroxcan', value: 7.0, quantity: 30, stock: 30).save
    end

    it 'insufficient stock' do
      expect(CartItem.count).to eql 0
      CartItem.new(cart_id: Cart.last.id, medicine_id: Medicine.last.id, quantity: 31).save
      expect(CartItem.count).to eql 0
    end

    it 'remove from stock' do
      CartItem.new(cart_id: Cart.last.id, medicine_id: Medicine.last.id, quantity: 10).save
      expect(Medicine.last.stock).to eql 20
    end
  end
end
