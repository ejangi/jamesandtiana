class AddKeyToUsers < ActiveRecord::Migration
  def self.up
    change_table :users do |t|
      t.string    :key
    end
  end

  def self.down
    change_table :users do |t|
      t.remove    :key
    end
  end
end
