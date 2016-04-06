class DesignerMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.customer_mailer.account_activation.subject
  #
  def account_activation(designer)
    @designer = designer

    mail to: designer.email_address, subject: "Your Nivishe Africa account activation"
  end

  def password_reset(designer)
    @designer = designer
    mail to: designer.email_address, subject: "Password reset for Nivishe Africa"
  end
end