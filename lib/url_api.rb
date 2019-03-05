require 'httparty'
class UrlApi
    def initialize(shop)
        @script_url="https://#{shop}/admin/script_tags.json"
        @shop_name="https://#{shop}"
        # @script_delete_url="https://#{shop}/admin/script_tags"
        # @charge_url="https://#{shop}/admin/recurring_application_charges.json"
    end
    def add_script(token)
        
        response = HTTParty.post(@script_url,headers: {"X-Shopify-Access-Token" =>token },:query => payload_data("header_file"))
        
    end
    def payload_data(file_name)
        {
      "script_tag": {
        "event": "onload",
        "src": "#{@shop_name}/apps/testapp1/js/#{file_name}"
              }
          }   
    end
end