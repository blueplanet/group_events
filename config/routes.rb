GroupEvents::Application.routes.draw do
  resources :groups, only: [:index]
  get "ui(/:action)", controller: 'ui'
end
