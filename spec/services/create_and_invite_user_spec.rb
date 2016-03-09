require "rails_helper"

describe CreateAndInviteUser do
  context "when user is valid" do
    it "creates a user" do
      user_params = attributes_for(:user)

      expect {
        described_class.new(user_params).save
      }.to change(User, :count).by(1)
    end

    it "generates a token" do
      user_params = attributes_for(:user)
      user = described_class.new(user_params).save

      expect(user.token).to be_present
    end

    it "sends an invite" do
      user_params = attributes_for(:user)
      allow_any_instance_of(User).to receive(:invite)

      user = described_class.new(user_params).save

      expect(user).to have_received(:invite)
    end

    it "returns the user" do
      user_params = attributes_for(:user)
      new_user = described_class.new(user_params).save

      expect(User.last).to eq new_user
    end
  end

  context "when user is not valid" do
    it "does not create a user" do
      expect {
        described_class.new({}).save
      }.not_to change(User, :count)
    end

    it "does not send an invite" do
      user = double("user")
      allow(user).to receive(:invite)
      allow(described_class).
        to receive_message_chain(:new, :save).and_return(user)

      described_class.new({}).save

      expect(user).not_to have_received(:invite)
    end

    it "returns the user with errors" do
      user = described_class.new({}).save

      expect(user.errors).not_to be_empty
    end
  end
end
