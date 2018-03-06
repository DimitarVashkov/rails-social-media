class WelcomeMailer < ApplicationMailer
  default from: "admin@blocks.com"
  def welcome_email(user)
    @user = user
    mail(to: @user.email, subject: 'Welcome to Blocks!')
  end
end
