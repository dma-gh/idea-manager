Rails.application.routes.draw do
  
  resources :projects do
  end

  devise_for :people, :controllers => { :registrations => "registrations" }
  
  root 'dashboard#index'
  get '/dashboard' => 'dashboard#index'
end
