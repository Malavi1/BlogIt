Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  #blog_posts/1
  resources :blog_posts 
  resources :comments
  # get '/blog_posts/new', to: 'blog_posts#new', as: :new_blog_post
  # get '/blog_posts/:id/edit', to: 'blog_posts#edit', as: :edit_blog_post
  # get '/blog_posts/:id', to: 'blog_posts#show', as: :blog_post
  # patch '/blog_posts/:id', to: 'blog_posts#update'
  # post '/blog_posts', to: 'blog_posts#create', as: :blog_posts
  # delete 'blog_posts/:id', to: 'blog_posts#destroy'
  # Defines the root path route ("/")
  root "blog_posts#index"
end






