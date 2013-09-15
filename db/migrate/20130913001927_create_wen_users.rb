class CreateWenUsers < ActiveRecord::Migration
  def change
    create_table :wen_users do |t|
      t.string :name, unique: true
      t.string :email
      t.integer :tel
      t.string :addr

      t.timestamps
    end
  end
end
