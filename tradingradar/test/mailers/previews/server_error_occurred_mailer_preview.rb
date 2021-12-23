# Preview all emails at http://localhost:3000/rails/mailers/server_error_occurred_mailer
class ServerErrorOccurredMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/server_error_occurred_mailer/generic
  def generic
    ServerErrorOccurredMailer.generic
  end

end
