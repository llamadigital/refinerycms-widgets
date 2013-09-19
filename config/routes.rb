Refinery::Core::Engine.routes.draw do

  # Admin routes
  namespace :widgets, :path => '' do
    namespace :admin, :path => "#{Refinery::Core.backend_route}/widgets" do
      resources :templates, :except => :show do
        collection do
          post :update_positions
          get :list
        end
      end
      resources :widgets, :only => [:create] do
        collection do 
          get :template
          get :page
        end
      end
      resources :widget_types, :only => [:show] do 
        collection do 
          get :new_for_page
          get :new_for_template
          get :show_for_page
          get :show_for_template
        end
      end
    end
  end

end
