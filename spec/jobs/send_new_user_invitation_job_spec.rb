require "rails_helper"

describe SendNewUserInvitationJob do
  describe "#perform" do
    it "calls on the UserMailer" do
      user = double("user", id: 1)
      allow(User).to receive(:find).and_return(user)
      allow(UserMailer).to receive_message_chain(:invite, :deliver_now)

      described_class.new.perform(user.id)

      expect(UserMailer).to have_received(:invite)
    end
  end

  describe ".perform_later" do
    it "adds the job to the queue :user_invites" do
      allow(UserMailer).to receive_message_chain(:invite, :deliver_now)

      described_class.perform_later(1)

      expect(enqueued_jobs.last[:job]).to eq described_class
    end
  end
end
