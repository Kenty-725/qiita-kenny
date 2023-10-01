# Rails.application.routes.draw do
#   # mount_devise_token_auth_for 'User', at: 'auth'
#   # # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

#   # # Defines the root path route ("/")
#   # # root "articles#index"
# end
Rails.application.routes.draw do
  devise_for :users
  namespace :api do
    mount_devise_token_auth_for 'User', at: 'auth'
  end
end
