Rails.application.routes.draw do
  get 'posts/:id/replies/new', to: 'replies#new', as: "new_reply_to_post"
  post 'posts/:id/replies', to: 'replies#create'

  get 'posts/:id/books/new', to: 'books#new', as: "new_book_to_post"
  post 'posts/:id/books', to: 'books#create'

  resources :books, :except => [ :index ]
  resources :replies, :except => [ :index ]
  resources :posts
  devise_for :users, :controllers => { registrations: 'registrations'}
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'statics#home'
end
