class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.text :steamid
      t.text :name
      t.text :nickname
      t.text :email
      t.text :password

      t.timestamps null: false
    end
  end
end
