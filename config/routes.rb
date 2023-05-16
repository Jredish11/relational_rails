Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
    get "/grow_rooms", to: "grow_rooms#index"
    resources :grow_rooms 
    get "/grow_rooms/:id", to: "grow_rooms#show"
    get "/grow_rooms/:id/strains", to: "strains#strains_by_grow_room"
    get "/grow_rooms/:id/strains_by_grow_room", to: "grow_rooms/strains#strains_by_grow_room"
    get "/strains", to: "strains#index"
    get "/strains/:id", to: "strains#show"
    get "/", to: "strains#index"
    post "/grow_rooms", to: "grow_rooms#create"
    get "/grow_rooms/:id/edit", to: "grow_rooms#edit"
    patch "/grow_rooms/:id", to: "grow_rooms#update"
    
  # Defines the root path route ("/")
  # root "articles#index"
end

#verbs: get, post, patch/put, delete
#Actions: index, show, new, update, create, destroy