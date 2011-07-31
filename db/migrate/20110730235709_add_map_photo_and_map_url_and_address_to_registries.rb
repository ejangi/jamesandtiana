class AddMapPhotoAndMapUrlAndAddressToRegistries < ActiveRecord::Migration
  def self.up
    change_table :registries do |t|
      t.string  :map_photo
      t.string  :map_url
      t.text    :address
    end
  end

  def self.down
    change_table :registries do |t|
      t.remove  :map_photo
      t.remove  :map_url
      t.remove  :address
    end
  end
end
