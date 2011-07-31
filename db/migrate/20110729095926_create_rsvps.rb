class CreateRsvps < ActiveRecord::Migration
  def self.up
    create_table :rsvps do |t|
      t.references  :user
      t.references  :registry
      t.boolean     :attending, :default => false
      t.integer     :number_of_guests, :default => 1
      t.text        :dietary_requirements
      t.timestamps
    end
  end

  def self.down
    drop_table :rsvps
  end
end
