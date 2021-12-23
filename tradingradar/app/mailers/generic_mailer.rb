class GenericMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.generic_mailer.contact.subject
  #
  def contact(name, email, message)
    @greeting = "Hi"
    @name = name
    @email = email
    @message = message

    mail to: "marcopavan.mp@gmail.com"
  end
end
