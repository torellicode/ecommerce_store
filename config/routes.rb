Rails.application.routes.draw do
  devise_for :users, path: '', 
    path_names: {
      sign_in: 'login',
      sign_out: 'logout',
      sign_up: 'sign_up'
    }

  # Public routes
   root "store#index"
   resources :categories, only: [:index, :show]
   resources :products, only: [:index, :show]
   resources :store, only: [:index]


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
