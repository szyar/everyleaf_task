class AddUserIdToLabels < ActiveRecord::Migration[5.2]
  def change
    add_column :labels, :user_id, :int
    add_foreign_key :labels, :users
  end
end
