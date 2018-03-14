class CreateConnectUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :connect_users do |t|
      t.integer :from_user_id
      t.integer :to_user_id

      t.timestamps
    end
  end
end
