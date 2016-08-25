class UserMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.account_activation.subject
  #
  def account_activation(user)
    @user = user
    mail to: user.email, subject: "Activacion de cuenta"
  end

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.password_reset.subject
  #
  def password_reset(user)
    @user = user
    mail to: user.email, subject: "Resetear password"
  end

  def weekly_mail(user)
    @user = user
    p= Product.where.not(offer:false,cover_picture:nil)
    @offers = p.first(5)
    mail to: user.email, subject: "Ofertas E-Shop"
  end
end
