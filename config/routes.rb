Rails.application.routes.draw do
    root "articles#index"

    resources :users, only: [ :create ]

    get "/login", to: "sessions#new", as: "login"
    post "/login", to: "sessions#create"
    delete "/logout", to: "sessions#destroy"

    get "/signup", to: "users#new", as: "signup"

    resources :articles, param: :slug
end
