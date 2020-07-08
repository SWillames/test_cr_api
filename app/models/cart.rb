class Cart < ApplicationRecord
  belongs_to :customer
  has_many :cart_items

  def total_cart_price
    total_price = 0
    CartItem.all.map do |x|
      medicine = Medicine.find(x.medicine_id)
      total_price = x.quantity * medicine.value
    end

    total_price
  end
end
