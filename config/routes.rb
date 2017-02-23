Rails.application.routes.draw do

  mount Attachinary::Engine => "/attachinary"

  root to: 'pages#home'

  devise_for :users,
    controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }

  resources :bags do
    resources :bookings, only: [:new, :create, :index]
  end

  resources :bookings, only: [:index, :show, :dashboard]

  get '/profile' => 'pages#profile'
  get '/listings' => 'pages#listings'
  get '/my-bookings' => 'pages#bookings'
  get '/inbox' => 'pages#inbox'
  get '/message' => 'pages#message'
  get '/message/:id' => 'pages#message_show'
  get '/dashboard' => 'pages#dashboard'
  get '/dashboard/:id/accept', to: 'bookings#accept'


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
