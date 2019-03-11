Rails.application.routes.draw do
  root :to => 'home#index'
  match '/shop/modify' => 'home#banner_modify' , as: :shop_modify, via: [:put, :post]
  get '/testapp1/js/header_file' => 'header#header_file'
  get '/new_banner' => 'home#new_banner'
  get '/edit_banner' => 'home#edit_banner'
  get '/testapp1/api/records'=> 'header#get_records'
  mount ShopifyApp::Engine, at: '/'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
