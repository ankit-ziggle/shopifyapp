class AddCreatedAtToBanners < ActiveRecord::Migration[5.2]
  def change
    add_column :banners, :active_at, :datetime

  end
end
