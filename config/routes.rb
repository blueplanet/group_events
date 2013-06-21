GroupEvents::Application.routes.draw do
  resources :groups, only: [:index, :show, :new, :create] do
    resources :events, only: [:show, :new, :edit, :create, :update] do
      member do
        get 'join'
        post 'create_kpt'
        delete 'delete_kpt'
      end
    end

    member do
      get "join", controller: "groups", action: "join"
    end
  end

  get "/auth/:provider/callback", controller: 'sessions', action: 'create'
  post "sign_out", controller: 'sessions', action: 'destroy'
  root to: 'groups#index'
  get "ui(/:action)", controller: 'ui'
end
