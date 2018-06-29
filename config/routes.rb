Rails.application.routes.draw do
  resources :portfolios

  get 'about-me',to: 'pages#about'
  get 'contact', to: 'pages#contact'

  resources :blogs    
  root 'pages#home'
  
 # get 'pages/home'
 # get 'pages/about'
 # get 'pages/contact'
end
