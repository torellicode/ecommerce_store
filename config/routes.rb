Rails.application.routes.draw do
  namespace :users do
    get 'vendor_onboardings/new'
    get 'vendor_onboardings/create'
  end
  devise_for :users

  # Public routes
   root "temp#home"

   # Users routes
  namespace :users do
    resource :vendor_onboarding, only: [:new, :create], path: 'become_vendor'
  end

  # Vendor routes
  namespace :vendor do
    get 'dashboard', to: 'dashboard#index'
  end

  # Admin routes
  namespace :admin do
    get 'dashboard', to: 'dashboard#index'
  end

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check
end
