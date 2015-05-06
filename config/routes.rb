Rails.application.routes.draw do
  root to: "lists#index"
  resources :lists do
    resources :tasks
  end
  get "archived_lists", to: "lists#archived_lists"
  get "/lists/:id/completed_tasks", to: "lists#completed_tasks", as: 'completed_tasks'

  namespace :api do
    resources :tasks, only: [:show, :index]
    post '/tasks/:id', to: 'tasks#update'
  end
end
