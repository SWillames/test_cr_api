class CartItem < ApplicationRecord
  belongs_to :cart
  belongs_to :medicine

  validates :cart_id, :medicine_id, :quantity, presence: true
  validate :positived_stock, :quantity_positived
  after_save :remove_from_stock
  
  private

  def positived_stock
    med = Medicine.find(medicine_id)

    errors.add(:quantity, 'No stock of medicine') unless med.stock.positive?
  end

  def quantity_positived
    med = Medicine.find(medicine_id)

    errors.add(:quantity, 'insufficient quantity') unless (med.stock - quantity).positive?
  end

  def remove_from_stock
    med = Medicine.last
    cart = CartItem.last
    med.stock -= cart.quantity
    med.save!
  end
end
