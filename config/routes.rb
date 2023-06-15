Rails.application.routes.draw do
  root to: 'pokemons#index'
  devise_for :users

  get 'users/show'
  get 'users/add_money'
  get 'users/deposit_money'
  get 'users/transactions'

  resources :pokemons, only: [:index, :show] do
    member do
      get 'checkout'
      post 'buy'
      post 'sell'
      post 'buy_demand'
      post 'cancel_sale'
    end
  end

  resources :buy_demands, only: [] do
    member do
      post 'accept'
      post 'reject'
      post 'cancel_buy_demand'
    end
  end

  get '/me', to: 'users#show'
  get '/me/add', to: 'users#add_money'
  patch '/me/add', to: 'users#deposit_money'
  get '/me/transactions', to: 'users#transactions'
  get '/me/buy_demands', to: 'users#buy_demands'

  # post '/buy_demands/:id/accept', to: 'buy_demands#accept', as: 'accept_buy_demand'
  # post '/buy_demands/:id/reject', to: 'buy_demands#reject', as: 'reject_buy_demand'

end
