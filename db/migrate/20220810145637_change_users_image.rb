class ChangeUsersImage < ActiveRecord::Migration[7.0]
  def change
    reversible do |dir|
      change_table :users do |t|
        dir.up   { t.change :image, :string }
        dir.down { t.change :image, :blob }
      end
    end
  end
end
