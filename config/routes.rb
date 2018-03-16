Rails.application.routes.draw do
  # get 'posts/:post_id/replies/new', to: 'replies#new', as: "new_reply_to_post"
  # post 'posts/:post_id/replies', to: 'replies#create'
  resources :posts do
  	resources :replies
  end
  devise_for :users, :controllers => { registrations: 'registrations'}
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'statics#home'
end
