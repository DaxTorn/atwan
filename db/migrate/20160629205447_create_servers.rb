class CreateServers < ActiveRecord::Migration
  def change
    create_table :servers do |t|
      t.text :uuid
      t.text :key
      t.text :name

      t.timestamps null: false
    end
  end
end
