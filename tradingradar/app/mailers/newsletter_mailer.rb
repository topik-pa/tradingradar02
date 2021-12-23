class NewsletterMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.newsletter_mailer.market.subject
  #
  def market(mail, sended)
    @greeting = "Hi"
    @mail = mail
    @sended = sended

    mail to: mail
  end

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.newsletter_mailer.stock.subject
  #
  def stock(stock, report, destinationMail, urls, sended)
    @greeting = "Hi"
    @stock = stock
    @report = report
    @destinationMail = destinationMail
    @urls = urls
    @sended = sended % 5

    mail(to: destinationMail,
         subject: t("newsletter_mailer.stock.subject", stockname: stock.name))
  end
end
