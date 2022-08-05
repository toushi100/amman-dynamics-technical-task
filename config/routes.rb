Rails.application.routes.draw do
  resources :tickets
  resources :projects
  devise_for :users
  root "projects#index"
end
