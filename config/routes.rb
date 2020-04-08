Rails.application.routes.draw do
  # chatroom
  root 'chatroom#index'

  # sessions
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'

  # messages
  post 'message', to: 'messages#create'
end
