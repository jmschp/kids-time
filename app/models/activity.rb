ACTIVITY_CATEGORIES = ["Aniversário", "Ar livre", "Casa", "Com Amigos", "Cozinha", "Livros", "Online", "Outros"]
class Activity < ApplicationRecord
  belongs_to :user
  has_many :orders
  has_many_attached :photos
end
