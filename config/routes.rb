Rails.application.routes.draw do
  devise_for :users

  # Public routes
   root "products#index"
   resources :products, only: [:index, :show]

   # Users routes
  namespace :users do
    resource :vendor_onboarding, only: [:new, :create], path: 'become_vendor'
  end

  # Vendor routes
  namespace :vendor do
    get 'dashboard', to: 'dashboard#index'
    resources :products do
      member do
        patch :toggle_visibility
      end
    end
  end

  # Admin routes
  namespace :admin do
    get 'dashboard', to: 'dashboard#index'
    resources :categories
  end

  get "up" => "rails/health#show", as: :rails_health_check
end
