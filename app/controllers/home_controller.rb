require './lib/url_api.rb'
class HomeController < ShopifyApp::AuthenticatedController
  skip_before_action :verify_authenticity_token
  def index
    @scripts = ShopifyAPI::ScriptTag.find(:all)
    @banner=Banner.new
  
    shop_name=session[:shopify_domain]
     shop_obj=Shop.find_by_shopify_domain(shop_name)
     if shop_obj.present?
      @bannerList=Banner.where(shop_id:shop_obj.id).order(:id)
      unless shop_obj.install
        @url_obj=UrlApi.new(shop_obj.shopify_domain)
        @url_obj.add_script(shop_obj.shopify_token)
        shop_obj.install=true
        shop_obj.save!
      end
     
    @banner.shop_id=shop_obj.id
    
    end
    
  end
  #Summary: create/update banner table
  #Params: banner_params
  #Author: Ankit
  
  def banner_modify
    
    if banner_params[:id].present?
        banner= Banner.find(banner_params[:id])
      if banner.present?
        banner.update(banner_params)
        banner.save
      end
      else
      banner=Banner.new(banner_params)
      banner.is_active=true
      banner.save
    end
    redirect_to action: 'index'
  end

  def new_banner
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
 def edit_banner
  @banner = Banner.find(params[:id])
  
  end
    
  end
  private
  def banner_params
    params.require(:banner).permit(:text,:font_color,:font_size,:background_color,:padding,:shop_id,:is_active, :id, :active_at, :deactive_at, :default)
  end

