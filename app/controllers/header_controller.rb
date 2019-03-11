class HeaderController < ApplicationController
    skip_before_action :verify_authenticity_token
    def header_file
       if params[:shop].present?
        shop_data=Shop.find_by_shopify_domain params[:shop]
    @banner=shop_data.banners.find_by("is_active=true AND ? BETWEEN active_at AND deactive_at", Time.now.in_time_zone(TZInfo::Timezone.get('Asia/Kolkata')))
        @banner=@banner|| shop_data.banners.find_by(default:true)
       end
       
    #    @banner=@banner.to_json
    @banner =@banner.to_json #JSON.parse(,object_class: OpenStruct)
        render 'header.js.erb'
    end


    def get_records
      shop_data=Shop.find_by_shopify_domain params[:shop] #session[:shopify_domain]
      @banner=shop_data.banners.find_by("is_active=true AND ? BETWEEN active_at AND deactive_at", Time.now.in_time_zone(TZInfo::Timezone.get('Asia/Kolkata')))
      @banner=@banner|| shop_data.banners.find_by(default:true)
        render :json =>@banner
    end
end