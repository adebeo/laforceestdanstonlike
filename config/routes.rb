Rails.application.routes.draw do

  resources :commentaires
  get "sites/checkin_site"=>  "sites#checkin_site" ,as: :checkin_site  
  get "sites/get_next_site"=>  "sites#get_next_site" ,as: :get_next_site  
  
  resources :sites
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'sites#main', as: :main


end
