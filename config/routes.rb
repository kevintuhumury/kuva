Kuva::Engine.routes.draw do

  resources :sets, only: [:index, :show]
  root to: "sets#index"

end
