class User < ActiveRecord::Base
  has_secure_password

  validates :email, presence: true, uniqueness: { case_sensitive: true }
  validates :password_digest, presence: true

  def invite
    SendNewUserInvitationJob.perform_later(id)
  end
end
