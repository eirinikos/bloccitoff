class UserMailer < ApplicationMailer
  default from: 'eirinikos@gmail.com'

  def account_activation(user)
    @user = user
    mail(
      to: user.email,
      subject: 'Please confirm your Bloccitoff account')
  end

  def password_reset(user)
    @user = user
    mail(to: user.email, subject: "Bloccitoff password reset")
  end
end
