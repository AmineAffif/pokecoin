class Pokemon < ApplicationRecord
  belongs_to :user
  has_many :transactions

  has_many :buy_demands

  validates :name, presence: true
  validates :price, numericality: { greater_than: 0 }
end
