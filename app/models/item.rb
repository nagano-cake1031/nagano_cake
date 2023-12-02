class Item < ApplicationRecord
  has_one_attached :image

  validates :introduction, presence: true, length: { maximum: 200 }

  def get_image
    if image.attached?
      image
    else
      'no_image.jpg'
    end
  end

  def with_tax_price
    (price * 1.1).floor
  end

  has_many :cart_items, dependent: :destroy
  has_many :order_details

end
