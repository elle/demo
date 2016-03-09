class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :email, null: false, index: true
      t.string :password_digest
      t.string :token
      t.datetime :confirmed_at

      t.timestamps null: false
    end
  end
end
