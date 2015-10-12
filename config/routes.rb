require "sidekiq/web"

Rails.application.routes.draw do
  root 'landing_pages#index'
  mount Sidekiq::Web, at: "/sidekiq"

  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations',
    omniauth_callbacks: 'users/omniauth_callbacks',
    confirmations: 'users/confirmations',
    passwords: 'users/passwords'
  }
  devise_scope :user do
    # delete 'sign_out', :to => 'devise/sessions#destroy', :as => :destroy_user_session
    match '/users/:id/finish_signup' => 'users/registrations#finish_signup', via: [:get, :patch], :as => :finish_signup
  end

  resources :dashboards, only: :show
  resources :mixfeeds, only: :show
  resources :landing_pages, only: :index
  resources :facebook_pages, only: :create
  resources :facebook_shares, only: [:new, :create, :update, :destroy]
  resources :twitter_shares, only: [:new, :create, :update, :destroy]
  resources :facebook_accounts, only: [:show]

  get '/facebook_pages/feed', to: 'facebook_pages#feed'
  get '/facebook_accounts/:id/feed', to: 'facebook_accounts#feed'
  post '/facebook_shares/boost', as: 'facebook_share_boost', to: 'facebook_shares#boost'

  get '/twitter_accounts/feed', to: 'twitter_accounts#feed'
  get '/twitter_accounts/home_feed', to: 'twitter_accounts#home_feed'
  get '/instagram_accounts/home_feed', to: 'instagram_accounts#home_feed'

  get '/mixfeeds/:user_id/retrieve_feeds', to: 'mixfeeds#retrieve_feeds'
  get '/mixfeeds/:user_id/insert_feeds', to: 'mixfeeds#insert_feeds'

  post '/twitter_shares/retweet/:tweet_uid', as: "twitter_shares_retweet", to: 'twitter_shares#retweet'
  post '/twitter_shares/favorite/:tweet_uid', as: "twitter_shares_favorite", to: 'twitter_shares#favorite'
  post '/twitter_shares/unfavorite/:tweet_uid', as: "twitter_shares_unfavorite", to: 'twitter_shares#unfavorite'
  post '/twitter_shares/reply/:tweet_uid', as: "twitter_shares_reply", to: 'twitter_shares#reply'

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
