class BuyDemand < ApplicationRecord
  belongs_to :buyer, class_name: 'User'
  belongs_to :seller, class_name: 'User'
  belongs_to :pokemon

  validates :buyer, presence: true
  validates :seller, presence: true
  validates :pokemon, presence: true
  validates :pokemon_id, uniqueness: true
end
