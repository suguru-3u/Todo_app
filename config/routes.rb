Rails.application.routes.draw do
  get 'users/new'
  get 'users/create'
  get 'users/destory'
  get 'users/index'
  get 'users/show'
  get 'users/update'
  get 'users/edit'
  root 'tops#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
