class Genre < ApplicationRecord
  has_one_attached :image
  has_many :posts, dependent: :destroy
  validates :name, uniqueness: true, presence: true
end
