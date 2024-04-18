Rails.application.routes.draw do

  devise_for :users

  resources :cards

root 'home#index'

get 'home/library'

  get "up" => "rails/health#show", as: :rails_health_check

end
