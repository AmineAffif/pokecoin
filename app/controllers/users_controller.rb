class UsersController < ApplicationController
  before_action :authenticate_user!
  # before_action :authenticate_user!, except: [:add_money]

  def show
    @user = current_user
  end

  def add_money
  end

  def deposit_money
    add_amount = params[:amount].to_f
    if add_amount.positive?
      current_user.update!(balance: current_user.balance + add_amount)
      flash[:notice] = "Money added successfully"
    else
      flash[:alert] = "Invalid amount to add."
    end
    redirect_to '/me'
  end

  def transactions
    @transactions = current_user.transactions
  end

  def buy_demands
    @buy_demands_sent = BuyDemand.where(buyer: current_user)
    @buy_demands_received = BuyDemand.where(pokemon: current_user.pokemons, seller: current_user)
  end

  private

  def authenticate_user!
    redirect_to root_path, alert: "You need to sign in first." unless current_user
  end

end
