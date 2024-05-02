class UserDrop < Liquid::Drop
  def initialize(user)
    @user = user
  end

  def email
    @user.email
  end

  def name
    @user.name
  end
end