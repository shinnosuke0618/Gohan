class Review < ApplicationRecord
  belongs_to :custmer
  belongs_to :post
end
