TimesheetApp::Application.routes.draw do




  resources :words do
    collection do
      get 'list'
    end
  end


  get "resources/khmerfont"

  get "resources/anki"

  get "resources/goals"

  get "resources/tests"

  get "resources/objectivechart"

  # This line mounts Forem's routes at /forums by default.
  # This means, any requests to the /forums URL of your application will go to Forem::ForumsController#index.
  # If you would like to change where this extension is mounted, simply change the :at option to something different.
  #
  # We ask that you don't use the :as option here, as Forem relies on it being the default of "forem"
  mount Forem::Engine, :at => '/forums'

   devise_for :users

resources :activities
resources :users do
  collection do
    get 'hours'
  end
  resources :timesheets do
    collection do
      get 'statistics'
      get 'all'
      get 'lastweek'
    end
  end
end

  authenticated :user do
    root :to => 'home#index'
  end
  root :to => "home#home"
end