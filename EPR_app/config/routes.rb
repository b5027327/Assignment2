Rails.application.routes.draw do
  get 'static_pages/home'
  root 'static_pages#home'
  get 'static_pages/about'
  get 'static_pages/contact'

 resources :products
 resources :iphones
 resources :ipads
 resources :iwatches
 resources :profiles
 resources :users
 resources :sessions
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
