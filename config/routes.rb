GroupEvents::Application.routes.draw do
  resources :groups, only: [:index]

  root to: 'groups#index'
  get "ui(/:action)", controller: 'ui'
end
