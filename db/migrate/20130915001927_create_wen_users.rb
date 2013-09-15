class CreateWenUsers < ActiveRecord::Migration
  def change
    create_table :wen_users do |t|
      t.string :name
      t.string :email
      t.integer :tel
      t.string :addr

      t.timestamps
    end
  end
end
