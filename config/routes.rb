Rails.application.routes.draw do
	resources :movies 
		devise_for :users
		# For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  		root to: "dashboard#index"

	 	get 'show_category', to: 'movies#show_category', as: 'show_category'
	 	get 'login', to: 'devise#new', as: 'login'
end
