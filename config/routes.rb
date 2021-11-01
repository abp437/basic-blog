Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  # The resources routes add up all the CRUD routes
  resources :posts do
    # These routes are nested within Posts
    resources :comments
  end

  root 'posts#index'
end
