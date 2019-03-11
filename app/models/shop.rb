class Shop < ActiveRecord::Base
  include ShopifyApp::SessionStorage
  has_many :banners,dependent: :destroy
end
