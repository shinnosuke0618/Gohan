class Post < ApplicationRecord

  belongs_to :customer
  belongs_to :genre
  has_many :reviews, dependent: :destroy

  has_one_attached :image

  validates :title, presence: true
  validates :introduction, presence: true
  validates :genre_id, presence: true

  def get_image
    (image.attached?) ? image : 'no_image1.jpg'
  end
  
   def avg_score
    unless self.reviews.empty?
      reviews.average(:score).round(1).to_f
    else
      0.0
    end
   end

  def review_score_percentage
    unless self.reviews.empty?
      reviews.average(:score).round(1).to_f*100/5
    else
      0.0
    end
  end

end
