Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  # Defines the root path route ("/")
  root "posts#index"

  resources :posts, defaults: { format: :json } do
    resources :comments, except: :show
  end

  resources :categories
  get '/:unique_id', to: 'posts#short_url'

  namespace :api do
    resources :regions, only: :index, defaults: { format: :json } do
      resources :provinces, only: :index, defaults: { format: :json }
      resources :districts, only: :index, defaults: { format: :json }
    end
  end
end
