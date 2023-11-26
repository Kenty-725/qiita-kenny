#   # # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
#   # # Defines the root path route ("/")
#   # # root "articles#index"
Rails.application.routes.draw do
  devise_for :users
  namespace :api do
    mount_devise_token_auth_for 'User', at: 'auth'
    namespace :v1 do
      resources :posts do
        get 'own_posts', on: :collection
      end
      resources :users, only: [:update] do
        get 'show_current_user', on: :collection     
      end
    end
  end
end
