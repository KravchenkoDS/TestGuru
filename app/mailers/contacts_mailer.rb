class ContactsMailer < ApplicationMailer

  default to: %{"TestGuru Project" <test_guru@mail.ru>}

  def contact_email(contact)
    @name = contact.name
    @email = contact.email
    @body = contact.body

    mail(from: @email)
  end

end