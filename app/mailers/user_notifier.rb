class UserNotifier < ApplicationMailer
    default from: ENV['MAILER_FROM_ADDRESS']

    def send_notification(user, alarm_text)
        @user = user
        delivery_options = {user_name: ENV['SMTP_USERNAME'],
                            password: ENV['SMTP_PASSWORD'],
                            address: ENV['SMTP_HOST'],
                            port: ENV['SMTP_PORT'],
                            tls: ENV['SMTP_TLS'],
                            ssl: ENV['SMTP_SSl'],
                            authentication: :login}
        mail(to: @user.email, subject: ENV['MAIL_SUBJECT'], content_type: 'text/html',
             body: alarm_text, delivery_method_options: delivery_options)
    end
end
