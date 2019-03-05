class HeaderController < ApplicationController
    skip_before_action :verify_authenticity_token
    def header_file
       if params[:shop].present?
        shop_data=Shop.find_by_shopify_domain params[:shop]
        @banner = Banner.where(:is_active=>true,shop_id:shop_data.id).first
       else
        @banner = Banner.new
       end
        render 'header.js.erb'
    end
end