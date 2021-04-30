Rails.application.routes.draw do
  resources :posts do
    resources :comments
  end
  resources :comments
  resources :users
  post '/authenticate', to: 'authentication#authenticate'
  delete '/sign_out', to: 'authentication#sign_out'
  get '/likes/:likable_type/:likable_id', to: 'likes#create'
end
