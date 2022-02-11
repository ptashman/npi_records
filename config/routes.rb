Rails.application.routes.draw do
  post 'npi_records', to: 'npi_records#update_or_create'
  resources :npi_records, param: :identifier, only: :index do
    resources :identifiers, only: :index, controller: 'npi_records/identifiers'
    resources :taxonomies, only: :index, controller: 'npi_records/taxonomies'
    resources :addresses, only: :index, controller: 'npi_records/addresses'
  end
end
