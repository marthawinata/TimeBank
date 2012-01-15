TimeBank::Application.routes.draw do

  get 'invitations/receive_response' => 'invitations#receive_response'
  resources :invitations

  get "bgg_scraper/index"

  get "bgg_scraper/scrape_game"

  devise_for :users

  get 'proposed_venues/upvote' => 'proposed_venues#upvote', :as => :upvote_venue
  get 'proposed_venues/downvote' => 'proposed_venues#downvote', :as => :downvote_venue
  resources :proposed_venues

  get 'proposed_timings/upvote' => 'proposed_timings#upvote', :as => :upvote_timing
  get 'proposed_timings/downvote' => 'proposed_timings#downvote', :as => :downvote_timing
  resources :proposed_timings

  resources :meetups do
    member do
      get 'join'
    end
  end


  get 'available_boardgames/upvote' => 'available_boardgames#upvote', :as => :upvote_boardgame
  get 'available_boardgames/downvote' => 'available_boardgames#downvote', :as => :downvote_boardgame
  resources :available_boardgames

  resources :collections

  resources :boardgames
  
  resources :games

  resources :game_sessions
  
  resources :players
  
  match ':controller(/:action(/:id))'
  match 'new_game' => 'new_game#index', :as => :configure_game



  # The priority is based upon order of creation:
  # first created -> highest priority.

  # Sample of regular route:
  #   match 'products/:id' => 'catalog#view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   match 'products/:id/purchase' => 'catalog#purchase', :as => :purchase
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Sample resource route with options:
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

  # Sample resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Sample resource route with more complex sub-resources
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', :on => :collection
  #     end
  #   end

  # Sample resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end

  # You can have the root of your site routed with "root"
  # just remember to delete public/index.html.
  root :to => "games#index"

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id(.:format)))'
end
