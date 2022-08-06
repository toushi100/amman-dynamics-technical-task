Rails.application.routes.draw do
  resources :projects do
    resources :tickets
  end
  post "projects/:id/invite" ,to: "projects#project_invite", as: "invite"
  post "projects/:id/add-user" ,to: "projects#add_user_to_project", as: "add_user"
  devise_for :users
  root "projects#index"
end
