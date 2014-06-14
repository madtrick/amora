Amora::Application.routes.draw do
   root to: 'main#new'
   post '/', to: 'main#create'

   namespace :resources do
     root to: 'root#index'
     get 'memory', to: 'memory#index'
     get 'system', to: 'system#index'
     get 'processes', to: 'processes#index'
     get 'process', to: 'process#index'
     get 'modules', to: 'modules#index'
   end

   namespace :api do
     get 'meta', to: 'meta#index'
     get 'memory', to: 'memory#index'
   end
end
