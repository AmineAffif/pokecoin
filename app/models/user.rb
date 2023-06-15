class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :balance, numericality: { greater_than_or_equal_to: 0 }

  has_many :transactions
  has_many :pokemons
  has_many :buy_demands, foreign_key: :buyer_id, dependent: :destroy

  def add_to_balance(amount)
    self.balance += amount
    save
  end

  def subtract_from_balance(amount)
    self.balance -= amount
    save
  end
end
