# product_type
#   true  ---> activity
#   false ---> product
ACTIVITY_CATEGORIES = ["Aniversário", "Ar livre", "Desporto", "Cozinha", "Livros", "Online", "Outros"]
class Activity < ApplicationRecord
  belongs_to :user
  has_many :orders
  has_many_attached :photos
  validates :title, presence: true, length: { maximum: 150 }
  validates :description, presence: true, length: { maximum: 1000 }
  validates :category, presence: true, inclusion: { in: ACTIVITY_CATEGORIES }
  validates :duration, length: { maximum: 50 }
  validates :min_age, presence: true, length: { maximum: 2 }
  validates :price, length: { maximum: 10 }
  validates :product_type, presence: true
end
