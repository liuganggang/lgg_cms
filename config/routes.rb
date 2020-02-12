Rails.application.routes.draw do
  root 'home#index'

  devise_for :users, controllers: { sessions: 'users/sessions' }
  devise_scope :user do
    get 'sign_in', to: 'users/sessions#new'
  end

  namespace :admin do
    root 'home#index'
    resources :categories
    resources :articles

  end

  mount LggBlog::API => '/'
end
