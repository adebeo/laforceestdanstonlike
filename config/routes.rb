Rails.application.routes.draw do
  resources :sites
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'sites#main', as: :main
  get "sites/get_next"=> "sites#get_next", as: :get_next

end
