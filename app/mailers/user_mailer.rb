class UserMailer < ApplicationMailer
  def user_email(user,project)
   @project  =project
   
    mail(to:user.email, subject:"Invitation to "+@project.title)
  end
end
