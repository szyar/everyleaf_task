class AddTasksForeignKey < ActiveRecord::Migration[5.2]
  def change
    add_foreign_key :tasks, :users
  end
end
