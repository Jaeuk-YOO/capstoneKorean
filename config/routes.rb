Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  match ':controller(/:action(/:id))', via: [:get, :post]

end
