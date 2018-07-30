Rails.application.routes.draw do
  
  authenticated :person do
    root to: redirect('/dashboard')
    get '/dashboard' => 'dashboard#index'
    get '/people' => 'dashboard#people', as: 'dashboard_people'
    get '/person/:id' => 'dashboard#person', as: 'person_skills'
    patch '/person/:id' => 'dashboard#update_person'
    get 'dashboard_archived_projects' => 'dashboard#archived', as: 'dashboard_archived_projects'
    get 'make_manager' => 'dashboard#make_manager', as: 'make_manager'
    get 'demote_manager' => 'dashboard#demote_manager', as: 'demote_manager'
    get 'message' => 'project#message'
    post '/projects/message' => 'dashboard#message'
    
    resources :projects do
      resources :events do
        get 'toggle_complete' => "events#toggle_complete", as: 'toggle_complete'
        resources :comments
      end
    end
  end

  root to: redirect('/people/sign_in')
  
  devise_for :people, :controllers => { :registrations => "registrations" }
  get '*path' => redirect('/')
end
