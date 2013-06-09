GroupEvents::Application.routes.draw do
  resources :groups, only: [:index, :show] do
    resources :events, only: [:show] do
      member do
        get 'join', controller: "events", action: "join"
        get 'absente', controller: "events", action: "absente"
      end
    end

    member do
      get "join", controller: "groups", action: "join"
    end
  end

  get "/auth/:provider/callback", controller: 'sessions', action: 'create'
  root to: 'groups#index'
  get "ui(/:action)", controller: 'ui'
end
