Rails.application.routes.draw do
  post '/rate' => 'rater#create', :as => 'rate'
  root to: 'home#index'
  resources :books do
    collection do
      get 'search'
    end
    resources :reviews
  end

  resources :books do
    member do
      post 'upvote'
    end
  end

  resources :books do
    member do
      post 'downvote'
    end
  end

  resources :age_groups do
    resources :books
  end

  devise_for :users, controllers: { registrations: "registrations", account_update: "registrations" }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  # This line with users resources should be  always below the devise_for users routes!
  resources :users, only: [:show, :edit, :update]
end
