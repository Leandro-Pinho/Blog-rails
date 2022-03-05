Rails.application.routes.draw do
  
  resources :ideas do
    resources :comments
  end
  
  devise_for :users
  get 'pages/info'
  
  root to: redirect('/ideas')
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
