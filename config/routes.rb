TimesheetApp::Application.routes.draw do
   devise_for :users
resources :users do
  resources :timesheets
end
  

  authenticated :user do
    root :to => 'home#index'
  end
  root :to => "home#index"
end