Rails.application.routes.draw do
  root to: 'home#index'
  resources :books do
    resources :reviews
  end
  devise_for :users, controllers: { registrations: "registrations" }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

end
