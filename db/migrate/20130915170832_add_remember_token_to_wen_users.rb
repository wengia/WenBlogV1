class AddRememberTokenToWenUsers < ActiveRecord::Migration
  def change
    add_column :wen_users, :remember_token, :string
    add_index :wen_users, :remember_token
  end
end
