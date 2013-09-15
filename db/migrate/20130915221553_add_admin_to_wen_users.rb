class AddAdminToWenUsers < ActiveRecord::Migration
  def change
    add_column :wen_users, :admin, :boolen, default: false
  end
end
