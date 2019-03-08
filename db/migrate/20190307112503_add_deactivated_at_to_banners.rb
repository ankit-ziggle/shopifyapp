class AddDeactivatedAtToBanners < ActiveRecord::Migration[5.2]
  def change
    add_column :banners, :deactive_at, :datetime
  end
end
