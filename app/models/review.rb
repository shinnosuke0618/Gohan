class Review < ApplicationRecord
  belongs_to :customer
  belongs_to :post
  validates :score, presence: true
end
