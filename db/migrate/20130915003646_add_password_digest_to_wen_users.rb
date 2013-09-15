class AddPasswordDigestToWenUsers < ActiveRecord::Migration
  def change
    add_column :wen_users, :password_digest, :string
  end
end
