Rails.application.routes.draw do
  resources :projects do
    resources :tickets
  end
  devise_for :users
  root "projects#index"
end
