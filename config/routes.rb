Kuva::Engine.routes.draw do

  resources :sets, only: [:index, :show] do
    resources :photo, only: :show
  end

  root to: "sets#index"

end
