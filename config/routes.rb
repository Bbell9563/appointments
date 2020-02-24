Rails.application.routes.draw do
  resources :appointments
  resources :doctors
  resources :patients
  root 'patients#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
