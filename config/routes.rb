Rails.application.routes.draw do
  resources :projects do
    resources :tickets do
    post "/download/:id", to: "tickets#download", as:"download"
    end
  end
  post "projects/:id/invite" ,to: "projects#project_invite", as: "invite"
  post "projects/:id/add-user" ,to: "projects#add_user_to_project", as: "add_user"
  devise_for :users, controllers: { registrations: "registrations" }
  root "projects#all_projects"
  get "my-projects",to: "projects#index"
end
