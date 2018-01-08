Rails.application.routes.draw do
  get 'admin/dash'

  resources :categories
  resources :posts
  devise_for :users
 root to: "pages#home"

  get 'pages/about'

  get 'pages/contact'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
