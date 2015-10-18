class UserMailer < ApplicationMailer
  default from: 'eirinikos@gmail.com'

  def account_activation(user)
    @user = user
    mail(
      to: user.email,
      subject: 'Please confirm your Bloccitoff account')
  end

  def password_reset
    @greeting = "Hej!"
    mail(to: "to@example.org")
  end
end
