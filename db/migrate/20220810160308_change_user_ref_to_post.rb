class ChangeUserRefToPost < ActiveRecord::Migration[7.0]
  def change
    remove_reference :posts, :user, null: false, foreign_key: true
    add_reference :posts, :author, null: false, foreign_key: { to_table: 'users' }
  end
end
