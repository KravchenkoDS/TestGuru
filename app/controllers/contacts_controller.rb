class ContactsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:new, :create]

  def new
    @contact = Contact.new
  end

  def create
    @contact = Contact.new(contact_params)
    if @contact.valid?
      ContactsMailer.contact_email(@contact).deliver_now
      redirect_to new_contact_path, notice: t('.success')
    else
      render :new
    end
  end

  private

  def contact_params
    params.require(:contact).permit(:title, :name, :email, :body)
  end
end
