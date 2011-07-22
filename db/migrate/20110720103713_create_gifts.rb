class CreateGifts < ActiveRecord::Migration
  def self.up
    create_table :gifts do |t|
      t.string :title
      t.text :description
      t.string :store
      t.string :colour
      t.integer :quantity
      t.decimal :price

      t.timestamps
    end
  end

  def self.down
    drop_table :gifts
  end
end
