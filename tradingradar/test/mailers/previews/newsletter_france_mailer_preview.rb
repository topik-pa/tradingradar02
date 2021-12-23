# Preview all emails at http://localhost:3000/rails/mailers/newsletter_france_mailer
class NewsletterFranceMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/newsletter_france_mailer/stock
  def stock
    NewsletterFranceMailer.stock
  end

  # Preview this email at http://localhost:3000/rails/mailers/newsletter_france_mailer/market
  def market
    NewsletterFranceMailer.market
  end

end
