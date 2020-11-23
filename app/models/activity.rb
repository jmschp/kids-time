ACTIVITY_CATEGORIES = ["Aniversário", "Ar livre", "Casa", "Com Amigos", "Cozinha", "Livros", "Online", "Outros"]
class Activity < ApplicationRecord
  belongs_to :user
  has_many :orders
  has_many_attached :photos
  validates :title, presence: true, length: { maximum: 150 }
  validates :description, presence: true, length: { maximum: 1000 }
  validates :category, presence: true, inclusion: { in: ACTIVITY_CATEGORIES }
  validates :duration, presence: true, length: { maximum: 50 }
  validates :duration, presence: true, length: { maximum: 50 }
  validates :min_age, presence: true, length: { maximum: 2 }
  validates :max_age, length: { maximum: 2 }
  validates :price, length: { maximum: 10 }
end
