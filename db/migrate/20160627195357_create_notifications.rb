class CreateNotifications < ActiveRecord::Migration
  def change
    create_table :notifications do |t|
      t.text :uuid
      t.text :key
      t.text :steamid
      t.text :notetitle
      t.text :message

      t.timestamps null: false
    end
  end
end
