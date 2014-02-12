Cqds::Application.routes.draw do
  get "donations/index"
  get 'test' => 'page_tab#test'
  get 'render_test' => 'heroes#render_test'
  get 'sdk' => 'sdk_test#index'
  get 'download_bizring' => 'home#download_bizring'
  get 'download_coloring' => 'home#download_coloring'
  get 'switch' => 'home#index'
  get 'please_like_this_page' => 'home#please_like_this_page'
  get 'canvas' => 'home#canvas'
  get 'game_result' => 'home#game_result'
  get 'mobile' => 'm#index'
  get 'mobile_gate' => 'm#fan_gate'
  get 'fb_login' => 'm#fb_login'
  get 'mobile_contents' => 'm#contents'
  get 'page_tab' => 'page_tab#index'
  get 'page_tab_gate' => 'page_tab#fan_gate'
  devise_for :users
  namespace :admin do
    get '/' => 'dashboard#index', ad: 'admin'
    resources :winners, only: [:index, :show]
    resources :users, only: [:index, :show]
    resources :donations, only: [:index, :show]
  end
  
  namespace :page_tab do
    resources :wall_posts, only: [:create]
  end

  namespace :m do
    resources :wall_posts, only: [:create]
    resources :users, only: [:show, :edit, :update]
  end

  resources :wall_posts, only: [:create]
  resources :users, only: [:create, :update] do
    member do 
      post :update
    end
  end
  root 'page_tab#index'  
end
