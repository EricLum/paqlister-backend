Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :api do
    namespace :v1 do
      resources :manifests, :items, :manifest_items, :users
        post '/manifests/getItems', to: 'manifests#getManifestItems'
        post '/login', to: 'users#login'
        post '/signup', to: 'users#signup'
    end
  end
end
