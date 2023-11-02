Rails.application.routes.draw do
  get 'rooms/index'
  devise_for :users
  get 'home/index'
  get 'home/show'
 
   root to: "home#index"
   resources :rooms
end
