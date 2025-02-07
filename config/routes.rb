Rails.application.routes.draw do
  devise_for :users
  resources :notes
  root to: "pages#home"
end
