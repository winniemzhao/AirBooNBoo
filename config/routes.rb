Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  resources :ghosts do
    resources :spooks, only: %i[new create]
  end
  get '/my-spooks', to: 'spooks#my_spooks', as: :my_spooks
  get '/my-spooks/:id', to: 'spooks#show', as: :my_spook
  get '/my-spooks/:id/edit', to: 'spooks#edit', as: :edit_my_spook
  patch '/my-spooks/:id', to: 'spooks#update'
  delete '/my-spooks/:id', to: 'spooks#destroy'

  get '/my-spooks/:spook_id/reviews/new', to: 'reviews#new', as: :new_review
  post '/my-spooks/:spook_id/reviews', to: 'reviews#create'

  get '/my-ghosts', to: 'ghosts#my_ghosts', as: :my_ghosts # ghost#index for gHost

  get '/my-ghosts-spooks', to: 'spooks#my_ghost_spooks', as: :my_ghost_spooks # for gHost
  get '/my-ghosts-spooks/:id/edit', to: 'spooks#edit_ghost_spooks', as: :edit_my_ghost_spook
  patch '/my-ghosts-spooks/:id', to: 'spooks#update_ghost_spooks'
end
