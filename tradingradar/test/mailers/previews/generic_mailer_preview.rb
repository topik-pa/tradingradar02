# Preview all emails at http://localhost:3000/rails/mailers/generic_mailer
class GenericMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/generic_mailer/contact
  def contact
    GenericMailer.contact
  end

end
