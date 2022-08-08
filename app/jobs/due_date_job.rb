class DueDateJob < ApplicationJob
  queue_as :default

  def perform(*args)
    @ticket = Ticket.find(*args[0].id)
    if @ticket.status != "Done"
      UserMailer.due_date(@ticket.project, @ticket).deliver_later
    end
  end
end
