Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :api do
    namespace :v1 do
      resources :manifests, :items, :manifest_items, :users
        post '/manifests/getItems', to: 'manifests#getManifestItems'
        post '/manifestitems/getManifestItemsPositions', to: 'manifest_items#getManifestItemsPositions'
        post '/users/login', to: 'auth#login'
        post '/users/signup', to: 'auth#signup'
    end
  end
end
