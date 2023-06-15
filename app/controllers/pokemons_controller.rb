class PokemonsController < ApplicationController
  before_action :set_pokemon, only: [:show, :buy, :sell, :buy_demand, :cancel_sale]
  before_action :authenticate_user!, except: [:index]

  def index
    @pokemons = Pokemon.all
  end

  def show
  end

  def buy
    if (@pokemon.on_sale || @pokemon.user.nil?) && (current_user.balance >= @pokemon.price)
      ActiveRecord::Base.transaction do
        Transaction.create!(action: "buy", user: current_user, pokemon: @pokemon)
        current_user.update!(balance: current_user.balance - @pokemon.price)
        @pokemon.update!(user: current_user)
      end
      flash[:notice] = "You have successfully bought the pokemon!"
    else
      flash[:alert] = "You do not have enough balance to buy this pokemon or it is not available for purchase."
    end
    redirect_to @pokemon
  end
  
  def sell
    if @pokemon.user == current_user
      ActiveRecord::Base.transaction do
        Transaction.create!(action: "sell", user: current_user, pokemon: @pokemon)
        current_user.update!(balance: current_user.balance + @pokemon.price)
        @pokemon.update_columns(on_sale: true)
      end
      flash[:notice] = "You have successfully put the pokemon on sale!"
    else
      flash[:alert] = "You do not own this pokemon."
    end
    redirect_to @pokemon
  end
    

  def buy_demand
    if @pokemon.user != current_user && @pokemon.user.present?
      buy_demand = current_user.buy_demands.build(pokemon: @pokemon, seller: @pokemon.user)
  
      if buy_demand.save
        flash[:notice] = "Buy demand sent successfully!"
      else
        flash[:alert] = "Failed to send buy demand."
      end
    else
      flash[:alert] = "This pokemon is not available for purchase."
    end
    redirect_to @pokemon
  end  

  def cancel_sale
    if @pokemon.user == current_user && @pokemon.user.present? && @pokemon.on_sale
      ActiveRecord::Base.transaction do
        Transaction.create!(action: "cancel_sale", user: current_user, pokemon: @pokemon)
        @pokemon.update_columns(on_sale: false)
      end
      flash[:notice] = "The pokemon is no longer on sale."
    else
      flash[:alert] = "You do not have permission to cancel the sale."
    end
    redirect_to @pokemon
  end
    
  private

  def set_pokemon
    @pokemon = Pokemon.find(params[:id])
  end

  def authenticate_user!
    unless user_signed_in?
      redirect_to new_user_session_path, alert: "You need to sign in first."
    end
  end
end
