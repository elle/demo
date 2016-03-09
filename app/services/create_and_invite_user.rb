class CreateAndInviteUser
  attr_accessor :user

  def initialize(user_params)
    @user = User.new(user_params)
  end

  def save
    if user.valid?
      generate_token
      user.save
      user.invite
    end

    user
  end

  private

  def generate_token
    user.token = Token.new
  end
end
