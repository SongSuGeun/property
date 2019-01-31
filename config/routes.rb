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
  
  resources :boards , only:[:index, :show, :edit] do
    collection do
      post :create_notice
      post :create_question
      
      get :write_noticeboards
      get :write_questionboard
    
      post :question_update
      get :notice_update
      post :notice_update
      
      get :question_show

      get :destroy_noticeboards
      get :destroy_questionboard
    end
  end
  
  resources :users, only: [ :new, :create, :show, :edit ,:update]
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
