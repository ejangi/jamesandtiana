class AddPhotoToGifts < ActiveRecord::Migration
  def self.up
    change_table :gifts do |t|
      t.string  :photo
    end
  end

  def self.down
    change_table :gifts do |t|
      t.remove  :photo
    end
  end
end
