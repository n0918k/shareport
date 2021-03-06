Rails.application.routes.draw do

  devise_for :users
  devise_scope :user do
    post 'users/guest_sign_in', to: 'users/sessions#new_guest'
  end

  root 'portfolios#index'
  resources :portfolios do
    collection do
      get 'favorite'
    end
  end
  post   '/like/:portfolio_id' => 'likes#like',   as: 'like'
  delete '/like/:portfolio_id' => 'likes#unlike', as: 'unlike'

end
