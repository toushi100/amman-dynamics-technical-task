class AddingUserIdToProjects < ActiveRecord::Migration[7.0]
  def change
    add_reference :projects, :users,foreign_key: true, index: true
  end
end
