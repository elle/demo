require "rails_helper"

describe User do
  describe "validations" do
    subject { build(:user) }

    it { is_expected.to have_secure_password }
    it { is_expected.to validate_presence_of(:email) }
    it { is_expected.to validate_uniqueness_of(:email) }
    it { is_expected.to validate_presence_of(:password_digest) }
  end

  describe "#invite" do
    it "temporarily return true" do
      user = build(:user)

      expect(user.invite).to eq(true)
    end
  end
end
