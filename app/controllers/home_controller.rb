require './lib/url_api.rb'
class HomeController < ShopifyApp::AuthenticatedController
  skip_before_action :verify_authenticity_token
  def index
    @scripts = ShopifyAPI::ScriptTag.find(:all)
    @banner=Banner.new
  
    shop_name=session[:shopify_domain]
     shop_obj=Shop.find_by_shopify_domain(shop_name)
     if shop_obj.present?
      @bannerList=Banner.where(shop_id:shop_obj.id)
      unless shop_obj.install
        @url_obj=UrlApi.new(shop_obj.shopify_domain)
        @url_obj.add_script(shop_obj.shopify_token)
        shop_obj.install=true
        shop_obj.save!
      end
     
    @banner.shop_id=shop_obj.id
    
    end
    
  end

  def banner_modify
    
    if banner_params[:id].present?
     #banner_obj= Banner.find_by(shop_id: banner_params[:shop_id])
      banner= Banner.find(banner_params[:id])
      if banner.present?
      Banner.update_all(is_active: false)
      banner.update(banner_params)
      banner.save
      end
    else
      
      banner=Banner.new(banner_params)
      Banner.update_all(is_active: false)
      banner.is_active=true
      banner.save
    end
    redirect_to action: 'index'
  end

  def new
    
  end
  private
  def banner_params
    params.require(:banner).permit(:text,:font_color,:font_size,:background_color,:padding,:shop_id,:is_active, :id)
  end
end
