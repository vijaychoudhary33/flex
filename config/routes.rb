Rails.application.routes.draw do
  # get 'welcome/index', to: 'welcome#index', as: 'welcome'
  devise_for :user, controllers: {
    sessions: 'user/sessions' }
  resources :movies
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "welcome#index"
  namespace :admin do
    resources :movies
    resources :user
    root to: "movies#index"
  end
end
