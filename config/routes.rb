Rails.application.routes.draw do
  root 'tops#home'
  resources:users
  get '/login',to:'sessions#new'
  post '/login',to:'sessions#create'
  delete '/logout',to:'sessions#destroy'
  resources:lists
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
