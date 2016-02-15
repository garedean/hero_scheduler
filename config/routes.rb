Rails.application.routes.draw do
  get 'dashboard/user'

  devise_for :users

  # Set root to user login page
  devise_scope :user do
    root to: "devise/sessions#new"
  end

  resources :users do
    collection do
      put 'reschedule'
    end
  end

  resources :work_days

  get '/dashboard', to: 'dashboard#user', as: 'dashboard'
end
