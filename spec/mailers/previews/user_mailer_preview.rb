# Preview all emails at http://localhost:3000/rails/mailers/user_mailer
class UserMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/user_mailer/invite
  def invite
    user = build(:user, token: "abc")
    UserMailer.invite(user)
  end
end
