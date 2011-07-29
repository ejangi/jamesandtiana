class AddShowNumberOfGuestsAndShowDietaryRequirementsToRegistries < ActiveRecord::Migration
  def self.up
    change_table :registries do |t|
      t.boolean   :show_number_of_guests, :default => false
      t.boolean   :show_dietary_requirements, :default => false
    end
  end

  def self.down
    change_table :registries do |t|
      t.remove   :show_number_of_guests
      t.remove   :show_dietary_requirements
    end
  end
end
