Rails.application.routes.draw do
  
  authenticated :person do
    root 'projects#index'
    get '/dashboard' => 'dashboard#index'
    get '/people' => 'dashboard#people', as: 'dashboard_people'
    get 'make_manager' => 'dashboard#make_manager', as: 'make_manager'
    get 'demote_manager' => 'dashboard#demote_manager', as: 'demote_manager'
    
    resources :projects do
      resources :events
    end
  end

  root to: redirect('/people/sign_in')
  
  devise_for :people, :controllers => { :registrations => "registrations" }
end
