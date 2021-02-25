Rails.application.routes.draw do
  devise_for :users
  get 'questions/answer'
  get 'questions/index2'
  root to: "questions#index"

  resources :questions, only: [:index, :new, :create, :show, :edit, :update, :destroy]

  resources :questions do
    resources :comments, only: :create
  end
  
  resources :users, only: :show
  
end
