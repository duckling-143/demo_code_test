Rails.application.routes.draw do
  resources :campaigns
  resources :campaigns, only: [:index, :show] do
    resources :investments, only: [:index, :show, :create]
  end
end
