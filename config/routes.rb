Nal::Application.routes.draw do  
  
  root :to => "strands#index"

  match ":year/festival" => "strands#index"
  match ":year/programme" => "events#index"

  match "news" => "news_items#index"
  match "news/:id" => "news_items#show", :as => :news_item

  # old site menu redirects  
  match "/blog/133/archive", :to  => redirect("/#{Nal::Application::CURRENT_YEAR}/archive")
                                                                                           
  match "/blog/131/about", :to  => redirect("/#{Nal::Application::CURRENT_YEAR}/about")
  match "/blog/130/contact", :to  => redirect("/#{Nal::Application::CURRENT_YEAR}/contact")
  
  match "/blog", :to  => redirect("/news")

  # old blog redirects
  #  e.g. blog/195/listen-to-and-vote-for-the-submissions
  match "/blog/:old_id/:old_slug" => "news_items#show"


  match "tag/:id" => "news_items#tagged_with"

  
  #replicated from Typus. just to give higher precedence than below
  scope "admin", :module => :admin, :as => "admin" do
    match "/" => "dashboard#show", :as => "dashboard"
    match "user_guide" => "base#user_guide"

    if Typus.authentication == :session
      resource :session, :only => [:new, :create], :controller => :session do
        get :destroy, :as => "destroy"
      end

      resources :account, :only => [:new, :create, :show, :forgot_password] do
        collection do
          get :forgot_password
          post :send_password
        end
      end
    end

    Typus.models.map { |i| i.to_resource }.each do |resource|
      match "#{resource}(/:action(/:id(.:format)))", :controller => resource
    end

    Typus.resources.map { |i| i.underscore }.each do |resource|
      match "#{resource}(/:action(/:id(.:format)))", :controller => resource
    end

  end

  match "/search" => "search#search"

  match ":year/participants" => "participants#index", :as => :participants
  match ":year/participant/:id" => "participants#show", :as => :participant

  match ":year/strands" => "strands#index"
  match ":year/strand/:id" => "strands#show", :as => :strand

  match ":year/events" => "events#index"
  match ":year/event/:id" => "events#show", :as => :event

  match "sitemap.xml" => "sitemap#sitemap"

  #keep as lowest precedence
  match ":year/:slug" => "pages#dynamic", :as => :pages

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
  # root :to => "welcome#index"

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id(.:format)))'
end
