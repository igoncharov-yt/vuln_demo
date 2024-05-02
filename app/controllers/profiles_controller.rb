class ProfilesController < BaseController
  before_action :set_user

  def show
  end

  def edit
  end

  def update
    if @user.update(params[:user].permit!)
      redirect_to profile_url(@user)
    else
      render :edit
    end
  end

  private

  def set_user
    @user = User.find(params[:id])
  end
end
