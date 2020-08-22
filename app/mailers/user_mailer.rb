class UserMailer < ApplicationMailer
  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.send_csv.subject
  #
  def send_csv(upload_csv)
    @greeting = 'Hi'
    attachments['parsed.csv'] = File.read(upload_csv.generated_csv)
    mail(to: JSON.parse(upload_csv.users), subject: 'Csv is parsed succesfully.')
  end
end
