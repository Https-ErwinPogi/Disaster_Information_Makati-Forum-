Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  # Defines the root path route ("/")
  root to: "posts#index"
  constraints(ClientDomainConstraint.new) do
    resources :posts do
      resources :comments, except: :show
    end
  end
  resources :categories
  get '/:unique_id', to: 'posts#short_url'

  constraints(AdminDomainConstraint.new) do
    namespace :admin do
      resources :users
    end
  end

  namespace :api do
    resources :regions, only: :index, defaults: { format: :json } do
      resources :provinces, only: :index, defaults: { format: :json } do
        resources :cities_municipalities, only: :index, defaults: { format: :json } do
          resources :barangays, only: :index, defaults: { format: :json }
        end
      end
      resources :districts, only: :index, defaults: { format: :json } do
        resources :cities_municipalities, only: :index, defaults: { format: :json } do
          resources :barangays, only: :index, defaults: { format: :json }
        end
      end
    end
  end
end
