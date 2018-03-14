class CreateChats < ActiveRecord::Migration[5.0]
  def change
    create_table :chats do |t|
      t.references :user1, foreign_key: { name: :users }
      t.references :user2, foreign_key: { name: :users }

      t.timestamps
    end
  end
end
