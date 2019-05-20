class User::SessionsController < Devise::SessionsController
  def create
    super
    flash[:notice] = "#{t('.hello')}, #{current_user.full_name.html_safe}!"
  end
end