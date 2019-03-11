class AddDefaultToBanners < ActiveRecord::Migration[5.2]
  def change
    add_column :banners, :default, :boolean
  end
end
