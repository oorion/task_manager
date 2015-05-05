Rails.application.routes.draw do
  root to: "lists#index"
  resources :lists
  get "archived_lists", to: "lists#archived_lists"
end
