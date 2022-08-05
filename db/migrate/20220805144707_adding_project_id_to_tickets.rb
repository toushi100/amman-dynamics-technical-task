class AddingProjectIdToTickets < ActiveRecord::Migration[7.0]
  def change
    add_reference :tickets, :projects,foreign_key: true, index: true

  end
end
