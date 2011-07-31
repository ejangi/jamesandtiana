class AddGiftRegistryIntroductionToRegistries < ActiveRecord::Migration
  def self.up
    change_table :registries do |t|
      t.text  :gift_registry_introduction
    end
  end

  def self.down
    change_table :registries do |t|
      t.remove  :gift_registry_introduction
    end
  end
end
