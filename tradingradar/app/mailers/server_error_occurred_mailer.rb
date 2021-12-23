class ServerErrorOccurredMailer < ApplicationMailer

  #default from 'Marco Pavan <marcopavan.mp@gmail.com>'
  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.server_error_occurred_mailer.generic.subject
  #
  def generic(error)
    @username = "Marco"
    @error = error

    mail to: "marcopavan.mp@gmail.com"
  end
end
