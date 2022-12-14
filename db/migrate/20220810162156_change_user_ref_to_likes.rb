class ChangeUserRefToLikes < ActiveRecord::Migration[7.0]
  def change
    remove_reference :likes, :user, null: false, foreign_key: true
    add_reference :likes, :author, null: false, foreign_key: { to_table: 'users' }
  end
end
