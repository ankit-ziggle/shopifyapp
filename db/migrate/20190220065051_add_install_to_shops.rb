class AddInstallToShops < ActiveRecord::Migration[5.2]
  def change
    add_column :shops,:install,:boolean, :initial => false
  end
end
