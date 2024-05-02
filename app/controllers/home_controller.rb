class HomeController < BaseController
  def index
    @users = User.order(id: :desc)
    if params[:name].present?
      @users = @users.where("name ILIKE '%#{params[:name]}%'")
    end
  end
end
