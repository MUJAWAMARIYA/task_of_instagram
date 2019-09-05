Rails.application.routes.draw do
  
  resources :favorites
  resources :profiles

  resources :posts do
    resources :comments
  end

  devise_for :users, controllers: { sessions: "users/sessions" }
  root 'posts#index' 
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
