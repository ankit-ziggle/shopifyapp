class AddIsActiveToBanners < ActiveRecord::Migration[5.2]
  def change
    add_column :banners, :is_active, :integer
  end
end
