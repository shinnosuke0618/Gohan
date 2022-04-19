class Review < ApplicationRecord
  belongs_to :custmer
  belongs_to :post
  validates :score, presence: true
end
