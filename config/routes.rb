Rails.application.routes.draw do

  get "sites/checkin_site"=>  "sites#checkin_site" ,as: :checkin_site  
  resources :sites
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'sites#main', as: :main


end
