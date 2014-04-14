Kuva::Engine.routes.draw do

  resources :sets, only: [:index, :show] do
    resources :photos, only: :show
  end

  root to: "sets#index"

end
