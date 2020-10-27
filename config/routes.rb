Rails.application.routes.draw do
  resources :users
  resources :comments
  resources :posts

  post 'users/:id/posts/:id/update_post', to: 'post#update_post'
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
