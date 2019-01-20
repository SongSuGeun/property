Rails.application.routes.draw do

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
  
  resources :boards , only:[:index, :show, :destroy] do
    collection do
      post :create_notice
      post :create_question
      
      get :write_noticeboards
      get :write_questionboard
    
      #get :question_update
      post :notice_update
      post :question_update
      get :question_show
      
      get :destroy_noticeboards
      get :destroy_questionboard
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
  
  get 'logout' , to: 'sessions#destroy', via: 'delete'
  get 'propertys/search' => 'propertys#search'
  get 'searches/result'
  get 'searches/many_result'
end
