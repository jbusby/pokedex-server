Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :pokemon, only: [:index, :show]
      resources :abilities, only: [:index, :show]
    end
  end
end
