class Activity < ApplicationRecord
  ACTIVITY_CATEGORIES = ["Aniversário", "Ar livre", "Desporto", "Cozinha", "Livros", "Online", "Outros"]
  belongs_to :user
  has_many :orders
  has_many_attached :photos

  validates :title, presence: true, length: { maximum: 150 }
  validates :description, presence: true, length: { maximum: 1000 }
  validates :category, presence: true, inclusion: { in: ACTIVITY_CATEGORIES }
  validates :duration, length: { maximum: 50 }
  validates :min_age, presence: true, length: { maximum: 2 }
  validates :price, length: { maximum: 10 }

  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?
end
