class AddIndexToWenusersName < ActiveRecord::Migration
  def change
    add_index :wen_users, :name, unique: true
  end
end
