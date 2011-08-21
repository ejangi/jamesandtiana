class AddPhotoToRegistries < ActiveRecord::Migration
  def self.up
    change_table :registries do |t|
      t.string :photo
    end
  end

  def self.down
    change_table :registries do |t|
      t.remove :photo
    end
  end
end
