Rails.application.routes.draw do
  root to: 'rooms#show'
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: "users/registrations",
    confirmations: "users/confirmations"
  }

  devise_scope :user do
    patch "users/confirmation", to: "users/confirmations#confirm"
  end

  if Rails.env.development?
    mount LetterOpenerWeb::Engine, at: "/letter_opener"
  end

  resources :rooms 
  resources :chats

  post '/users/:id/make_friend' => 'users#make_friend'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
