Rails.application.routes.draw do

  #staic paths, default to menu
  get 'menu/main'
  root'menu#main'
  get 'demo/index'
  get 'demo/hello'
  get 'demo/escape_output'
  # Resourceful route for pages
  resources :pages do

    member do
      get :delete
    end
  end

  # Resourceful route for sections
  resources :sections do

    member do
      get :delete
    end
  end
 
 # Resourceful route for subjects
  resources :subjects do

  	member do
  		get :delete
  	end

  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
