Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "posts#index"

  resources :posts, path_names: {new: '99', edit: '88'} do
    resources :comments, except: :show
  end

  resources :categories
end
