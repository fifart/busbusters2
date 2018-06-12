Rails.application.routes.draw do
  resources :postings, only: [:show, :update, :destroy, :new, :create, :edit]
  devise_for :users
  root 'pages#index'
  get '/requests', to: "pages#requests"
  get '/declarations', to: "pages#declarations"

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
