class AddUserIdTasks < ActiveRecord::Migration[5.2]
  def change
    add_column :tasks, :user_id, :int
  end
end
