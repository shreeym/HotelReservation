Rails.application.routes.draw do
  get 'homes/index'
  get 'homes/getRooms'
  get 'homes/show'
  get 'homes/getUserReservedRooms'
  devise_for :users
  root 'homes#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
