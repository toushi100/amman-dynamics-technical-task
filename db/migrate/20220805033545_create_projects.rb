class CreateProjects < ActiveRecord::Migration[7.0]
  def change
    create_table :projects do |t|
      t.column :title, :string
      t.column :description, :text
      t.timestamps
    end
  end
end
