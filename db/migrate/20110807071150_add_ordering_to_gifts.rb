class AddOrderingToGifts < ActiveRecord::Migration
  def self.up
    change_table :gifts do |t|
      t.integer  :ordering, :default => 0
    end
  end

  def self.down
    change_table :gifts do |t|
      t.remove  :ordering
    end
  end
end
