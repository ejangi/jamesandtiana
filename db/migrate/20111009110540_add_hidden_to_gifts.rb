class AddHiddenToGifts < ActiveRecord::Migration
  def self.up
    change_table :gifts do |t|
      t.boolean  :hidden, :default => 0
    end
  end

  def self.down
    change_table :gifts do |t|
      t.remove  :hidden
    end
  end
end
