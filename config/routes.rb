Rails.application.routes.draw do
    root "articles#index"
    get "/article/:slug", to: "articles#show", as: "article_by_slug"
    get "/login", to: "sessions#new"
    get "/signup", to: "users#new"
    resources :articles, param: :slug
end
