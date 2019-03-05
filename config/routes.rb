Rails.application.routes.draw do
  root :to => 'home#index'
  post '/shop/modify' => 'home#banner_modify'
  get '/testapp1/js/header_file' => 'header#header_file'
  mount ShopifyApp::Engine, at: '/'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
