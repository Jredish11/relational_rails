Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
    get "/grow_rooms", to: "grow_rooms#index"
    get "/grow_rooms/:id", to: "grow_rooms#show"
    get "/strains", to: "strains#index"
    get "/strains/:id", to: "strains#show"
  # Defines the root path route ("/")
  # root "articles#index"
end

#verbs: get, post, patch/put, delete
#Actions: index, show, new, update, create, destroy