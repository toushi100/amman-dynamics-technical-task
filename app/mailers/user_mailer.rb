class UserMailer < ApplicationMailer
  def user_email(user,project)
   @project  =project
   
    mail(to:user.email, subject:"Invitation to "+@project.title)
  end

  def due_date(project,ticket)
    @project = project
    @ticket = ticket
    mail(to:project.users.pluck(:email) , subject:"Ths ticket needs your attention")
  end
end
