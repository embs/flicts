class SignUpMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.sign_up_mailer.success.subject
  #
  def success(user)
    @greeting = "Hi"

    mail to: user.email
  end
end
