Rails.application.routes.draw do
  resources :npi_records, param: :identifier, only: :index do
    member do
      post :update_or_create
    end
    resources :identifiers, only: :index
    resources :taxonomies, only: :index
    resources :addresses, only: :index
  end
end
