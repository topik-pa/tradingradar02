# Preview all emails at http://localhost:3000/rails/mailers/newsletter_mailer
class NewsletterMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/newsletter_mailer/market
  def market
    NewsletterMailer.market
  end

  # Preview this email at http://localhost:3000/rails/mailers/newsletter_mailer/stock
  def stock
    NewsletterMailer.stock
  end

end
