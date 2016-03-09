class UserMailer < ApplicationMailer
  def invite(user)
    @user = user

    mail to: @user.email
  end
end
