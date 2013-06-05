GroupEvents::Application.routes.draw do
  resources :groups, only: [:index, :show] do
    resources :events, only: [:show]
  end

  get "/auth/:provider/callback", controller: 'sessions', action: 'create'
  root to: 'groups#index'
  get "ui(/:action)", controller: 'ui'
end
