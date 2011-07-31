class CreateContributions < ActiveRecord::Migration
  def self.up
    create_table :contributions do |t|
      t.references  :registry
      t.references  :gift
      t.references  :user
      t.decimal     :amount, :precision => 10, :scale => 2
      t.timestamps
    end
  end

  def self.down
    drop_table :contributions
  end
end
