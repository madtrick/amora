Amora::Application.routes.draw do
   root to: 'main#new'
   post '/', to: 'main#create'

   namespace :resources do
     root to: 'root#index'
     get 'memory', to: 'memory#index'
   end
end
