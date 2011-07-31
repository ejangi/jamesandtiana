class AddDetailsToRegistries < ActiveRecord::Migration
  def self.up
    change_table :registries do |t|
      t.text  :details
    end
  end

  def self.down
    change_table :registries do |t|
      t.remove  :details
    end
  end
end
