Rails.application.routes.draw do
  get 'reservations/index'
  devise_for :users
  get 'home/index'
  get 'home/show'
 
   root to: "home#index"
   resources :rooms
   resources :reservations

  resources :reservations, only: [:index, :new, :create, :show] do
    collection do
      post :confirm
    end
  end

  post 'reserve/back' # 確認画面から「入力画面に戻る」をクリックしたとき
end
