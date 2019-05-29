class ContactsMailer < ApplicationMailer

  default to: %{"TestGuru Project" <testguru.post@gmail.com>}

  def contact_email(contact)
    @name = contact.name
    @email = contact.email
    @body = contact.body

    mail(from: @email)
  end

end