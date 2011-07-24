class CreateRegistries < ActiveRecord::Migration
  def self.up
    create_table :registries do |t|
      t.string      :title
      t.text        :introduction
      t.datetime    :when
      t.string      :permalink
      t.timestamps
    end
  end

  def self.down
    drop_table :registries
  end
end
