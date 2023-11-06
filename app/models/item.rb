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

end
