GroupEvents::Application.routes.draw do
  resources :groups, only: [:index, :show] do
    resources :events, only: [:show]
  end

  root to: 'groups#index'
  get "ui(/:action)", controller: 'ui'
end
