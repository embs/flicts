# Preview all emails at http://localhost:3000/rails/mailers/sign_up_mailer
class SignUpMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/sign_up_mailer/success
  def success
    SignUpMailer.success
  end

end
