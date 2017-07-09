Rails.application.routes.draw do
  root to: 'pages#start'
  get '/start', to: 'pages#start'
  get '/game', to: 'pages#play'
  get '/result', to: 'pages#result'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
