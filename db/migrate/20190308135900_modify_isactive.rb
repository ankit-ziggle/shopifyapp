class ModifyIsactive < ActiveRecord::Migration[5.2]
  def change
    change_column :banners ,:is_active,'boolean USING CAST(is_active AS boolean)'
  end
end
