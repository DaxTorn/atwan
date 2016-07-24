class CreateUserServerJoinTable < ActiveRecord::Migration
  def change
    create_join_table :servers, :users do |t|
      # t.index [:server_id, :user_id]
      # t.index [:user_id, :server_id]
    end
  end
end
