Rails.application.routes.draw do
	get '/', to: 'application#welcome', as: :root
	get '/welcome', to: 'application#welcome'
	get '/signin', to: 'sessions#new', as: :signin
	post '/signin', to: 'sessions#create'
	post '/logout', to: 'sessions#destroy', as: :logout

	resources :users, only: [:new, :create, :show]
	resources :attractions
	resources :rides
end
