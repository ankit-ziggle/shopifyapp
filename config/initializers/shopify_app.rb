ShopifyApp.configure do |config|
  config.application_name = "My Shopify App"
  config.api_key = "7460fb2c8cdb33cdbd0743de03193adb"
  config.secret = "b59ccd52f4795f26e8a29a4c1b3d08fd"
  config.scope = "read_orders, read_products,write_products,read_themes,
                 write_themes,read_customers,write_customers,write_customers,
                 read_customers,read_script_tags, write_script_tags"
 config.embedded_app = true
#  config.webhooks=[
#        {topic: 'carts/update', address: 'https://7abeb03c.ngrok.io//webhooks/carts_update', format: 'json'}
#        ]
  config.embedded_app = true
  config.after_authenticate_job = false
  config.session_repository = Shop
end
