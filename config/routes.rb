Rails.application.routes.draw do
  root 'games#new'
  resources :games, only: %i[new create] do
    get :give_up, on: :member
    resource :progress, only: %i[new create]
  end
end
