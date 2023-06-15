class BuyDemandsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_buy_demand, only: %i[accept reject cancel_buy_demand]
  before_action :set_buy_pokemon, only: %i[accept reject cancel_buy_demand]

  def accept
    if @buy_demand.seller == current_user
      ActiveRecord::Base.transaction do
        Transaction.create!(action: "buy", user: @buy_demand.buyer, pokemon: @buy_demand.pokemon)
        @buy_demand.buyer.subtract_from_balance(@buy_demand.pokemon.price)
        @buy_demand.seller.add_to_balance(@buy_demand.pokemon.price)
        @buy_demand.pokemon.update!(user: @buy_demand.buyer)
      end
      flash[:notice] = "Buy demand accepted!"
    else
      flash[:alert] = "You do not have permission to perform this action."
    end
    redirect_to me_buy_demands_path
  end

  def reject
    if @buy_demand.seller == current_user
      @buy_demand.destroy
      flash[:notice] = "Buy demand rejected!"
    else
      flash[:alert] = "You do not have permission to perform this action."
    end
    redirect_to me_buy_demands_path
  end

  def cancel_buy_demand
    if @buy_demand.buyer == current_user
      @buy_demand.destroy
      @pokemon.update_columns(on_sale: false)
      flash[:notice] = "Buy demand canceled."
    else
      flash[:alert] = "You do not have permission to cancel the sale."
    end
    redirect_to @pokemon
  end

  private

  def set_buy_demand
    @buy_demand = BuyDemand.find(params[:id])
  end

  def set_buy_pokemon
    @pokemon = set_buy_demand.pokemon
  end

  def authenticate_user!
    redirect_to root_path, alert: "You need to sign in first." unless current_user
  end
end
