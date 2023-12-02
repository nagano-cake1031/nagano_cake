class OrderDetail < ApplicationRecord

  belongs_to :order
  belongs_to :item

  def subtotal_order_detail
    item.with_tax_price * amount
  end

end
