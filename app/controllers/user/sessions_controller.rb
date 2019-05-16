class User::SessionsController < Devise::SessionsController
  def create
    super
    flash[:notice] = "Hello, #{current_user.full_name.html_safe}!"
  end
end