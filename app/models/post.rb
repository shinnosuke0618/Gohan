class Post < ApplicationRecord

  belongs_to :customer
  belongs_to :genre
  has_many :reviews dependent: :destroy

  has_one_attached :image

  validates :title, presence: true
  validates :introduction, presence: true
  validates :genre_id, presence: true

  def get_image
    (image.attached?) ? image : 'no_image1.jpg'
  end

end
