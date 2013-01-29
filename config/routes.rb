Dartboard::Application.routes.draw do

  devise_for :users

match '/contact', :to => 'dart#contact'
match '/about',   :to => 'dart#about'
match '/price',   :to => 'dart#price'


root :to => 'dart#home'

resources :campaigns 
   	
end