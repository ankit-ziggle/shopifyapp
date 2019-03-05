class CreateBanners < ActiveRecord::Migration[5.2]
  def change
    create_table :banners do |t|
      t.string :text
      t.string :font_color
      t.string :font_size
      t.string :background_color
      t.string :padding
      t.belongs_to :shop

      t.timestamps
    end
  end
end
