class OrderDetail < ApplicationRecord

  belongs_to :order
  belongs_to :item

  def subtotal_order_detail
    price * amount
  end

end
