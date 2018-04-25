Rails.application.routes.draw do
  resources :receipts
  get 'posts/:post_id/replies/new', to: 'replies#new', as: "new_reply_to_post"
  post 'posts/:post_id/replies', to: 'replies#create'


  get 'posts/:post_id/books/new', to: 'books#new', as: "new_book_to_post"
  post 'posts/:post_id/books', to: 'books#create'

  get 'posts/:post_id/books/edit', to: 'books#edit'
  # patch 'posts/:post_id/books/:id/edit', to: 'books#update', as: "edit_book"
  # put 'posts/:post_id/books/:id/edit', to: 'books#update'
  #resources :users, controller: 'users', only: [:overview, :inprogess_transactions, :concluded_transactions]
  get 'users/overview', to: "users#overview", as: "user_overview"
  get 'users/inprogress_sells', to: "users#inprogress_sells", as: "user_inprogress_sells"
  get 'users/inprogress_buys', to: "users#inprogress_buys", as: "user_inprogress_buys"
  get 'users/concluded_transactions', to: "users#concluded_transactions", as: "user_concluded_transactions"
  resources :sales, :except   => [:index, :edit] do
    member do
      patch 'advance_state'
    end
  end
  resources :books, :except   => [:index] do
    member do
      patch 'toggle_visibility'
    end
  end
  resources :replies, :except => [:index]
  resources :posts do
   collection do
      get :books
    end
  end
  get 'posts/books/autocomplete', to: "posts#autocomplete", as: "books_autocomplete"
  # get 'posts/books', to: "posts#books", as: "posts_books"
  devise_for :users, :controllers => { registrations: 'registrations'}
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'statics#home'
end
