Rails.application.routes.draw do

  resources :blogs do
  	resources :entries do
  	  resources :comments, only: [:index, :search2, :new, :create, :destroy] do
  	    collection do
          get 'search1'
        end
        member do
          get 'search2'
        end
  	  end
  	end
  end
end
