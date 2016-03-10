class SendNewUserInvitationJob < ActiveJob::Base
  queue_as :user_invites

  def perform(user_id)
    user = User.find(user_id)

    UserMailer.invite(user).deliver_now
  end
end
