Rails.application.routes.draw do
  get 'searches/result'

  root 'propertys#index'
  
  resources :propertys do
    collection do
      post :confirm
      post :list
      get :list
      get :googlemap
      get :search
      get :popular_list
     end
  end
  
  
  resources :users, only: [ :new, :create, :show ]
  resources :sessions, only: [:new, :create, :destroy]
  resources :favorites, only: [:create, :destroy] do
    collection do
      get :favorite_list
      post :favorite_list
    
    end
  end
  # get 'logout' , to: 'sessions#destroy', via: 'delete'
  
  get 'propertys/search' => 'propertys#search'
end
