class Transaction < ApplicationRecord
  belongs_to :user
  belongs_to :pokemon

  enum action: { buy: 0, sell: 1, cancel_sale: 2 }
end
