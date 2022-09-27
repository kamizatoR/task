Rails.application.routes.draw do



  devise_for :users
  root to: "homes#top"
  get "homes/about" => "homes#about",as: "about"
  resources :users, only: [:edit,  :index, :show, :update ]
  resources :books, only: [:edit, :show, :index, :create, :destroy, :update]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
