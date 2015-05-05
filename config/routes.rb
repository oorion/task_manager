Rails.application.routes.draw do
  root to: "lists#index"
  resources :lists do
    resources :tasks
  end
  get "archived_lists", to: "lists#archived_lists"

  namespace :api do
    resources :tasks, only: [:show, :index]
  end
end
