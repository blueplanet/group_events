GroupEvents::Application.routes.draw do
  resources :groups, only: [:index, :show]

  root to: 'groups#index'
  get "ui(/:action)", controller: 'ui'
end
