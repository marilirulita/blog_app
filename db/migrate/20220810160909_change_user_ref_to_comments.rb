class ChangeUserRefToComments < ActiveRecord::Migration[7.0]
  def change
    remove_reference :comments, :user, null: false, foreign_key: true
    add_reference :comments, :author, null: false, foreign_key: { to_table: 'users' }
  end
end
