class ApplicationMailer < ActionMailer::Base
  default from: %{"TestGuru" <test_guru@mail.ru>}
  layout 'mailer'
end
