Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  devise_for :admins, controllers: {
  sessions:      'admins/sessions',
  passwords:     'admins/passwords',
  registrations: 'admins/registrations'
}
  devise_for :users, controllers: {
  sessions:      'users/sessions',
  passwords:     'users/passwords',
  registrations: 'users/registrations'
}
  root 'public/homes#top'

  scope module: :public do
  get 'games' => 'games#ps4'
  get 'games' => 'games#switch'
  get 'games' => 'games#genre'
  get 'games' => 'games#year'
  get 'games' => 'games#show'
  resources :users, only: [:show, :edit, :update, :index]
  get 'users' => 'users#unsubscribe'
  patch 'users' => 'users#withdraw'
  resources :reviews, only: [:create, :edit, :update, :destroy]
  resources :favorites, only: [:new, :create, :index, :show]
  resources :comments, only: [:create, :destroy]
  end
  namespace :admin do
  get 'games' => 'games/top'
  resources :games, only: [:index, :new, :create, :show, :edit, :update]
  resources :genres, only: [:index, :create, :edit, :update]
  resources :years, only: [:index, :create, :edit, :update]
  resources :users, only: [:index, :show, :edit, :update]
  resources :reviews, only: [:index, :show, :uodate]
  end
end
