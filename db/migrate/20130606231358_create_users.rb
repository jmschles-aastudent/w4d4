class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :email
      t.string :password_digest
      t.boolean :activated
      t.string :user_type
      t.string :session_token
      t.string :activation_token

      t.timestamps
    end
  end
end
