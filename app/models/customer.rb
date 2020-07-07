class Customer < ApplicationRecord
  has_many :carts

  def name
  	b = []
    self[:name].split.each do |x|
    	b << x.capitalize
    end

    b.join(" ")
  end
end
