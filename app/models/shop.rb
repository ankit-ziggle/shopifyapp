class Shop < ActiveRecord::Base
  include ShopifyApp::SessionStorage
  has_many :banner,dependent: :destroy
end
