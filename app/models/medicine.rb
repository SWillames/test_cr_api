class Medicine < ApplicationRecord
  validates :name, :value, :quantity, :stock, presence: true
  validates :value, numericality: { greater_than: 0 }
  validates :stock, :quantity, numericality: { greater_than_or_equal_to: 0, only_integer: true }
  def total
    value.to_f * quantity
  end
end
