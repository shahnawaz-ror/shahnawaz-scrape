Rails.application.routes.draw do

  resources :upload_csvs
  # get 'upload_csv/new'
  get 'home/index'
  # devise_for :users
  root 'home#index'
end
