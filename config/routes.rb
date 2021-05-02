Rails.application.routes.draw do
  # root to: 'コントローラー名：top'
  root to: 'homes#top'
  get "home/about" => "homes#about"
  # deviseを使用する際にURLとしてusersを含むことを示している
  devise_for :users
  resources :users, only: [:index, :show, :edit, :update]
  # createはある
  resources :books, only: [:index, :show, :create, :edit, :destroy, :update]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
