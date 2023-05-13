Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
    get "/grow_rooms", to: "grow_rooms#index"
    get "/grow_rooms/:id", to: "grow_rooms#show"
    get "/grow_rooms/:id/strains", to: "strains#strains_by_grow_room"
    get "/strains", to: "strains#index"
    get "/strains/:id", to: "strains#show"
    get "/", to: "strains#index"
  # Defines the root path route ("/")
  # root "articles#index"
end

#verbs: get, post, patch/put, delete
#Actions: index, show, new, update, create, destroy