Rails.application.routes.draw do

  get 'homes/about'
  get 'users/show'
  devise_for :users
# For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
    root to: 'homes#top'
    root to: 'homes#top'
    get 'home/about',to: 'homes#about'
    get 'users' => 'users#index'
    resources :books
    resources :users, only: [:show, :edit, :update]
    resources :users, only: [:new, :create, :index, :show, :destroy] do
  end
end
