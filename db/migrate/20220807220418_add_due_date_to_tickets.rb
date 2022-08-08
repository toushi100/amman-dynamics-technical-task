class AddDueDateToTickets < ActiveRecord::Migration[7.0]
  def change
    add_column :tickets, :due_date, :date
    #Ex:- add_column("admin_users", "username", :string, :limit =>25, :after => "email")
  end
end
