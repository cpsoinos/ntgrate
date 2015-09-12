class UserMailer < BaseMandrillMailer
  helper :application
  include Devise::Controllers::UrlHelpers

  def reset_password_instructions(record, token, opts={})
    options = {
      subject: "Password Reset",
      email: record.email,
      template: "reset_password",
      reset_password_url: edit_password_url(record, reset_password_token: token)
    }
    mandrill_send(options)
  end

  def confirmation_instructions(record, token, opts={})
    options = {
      subject: "Email confirmation",
      email: record.email,
      first_name: record.first_name,
      confirmation_url: confirmation_url(record, confirmation_token: record.confirmation_token),
      template: "welcome"
    }
    mandrill_send(options)
  end

  def mandrill_send(opts={})
    message = {
      subject: opts[:subject],
      to: [
        { name: opts[:name],
          email: opts[:email],
          type: "to" }
      ],
      fname: opts[:first_name],
      confirmation_url: opts[:confirmation_url],
      reset_password_url: opts[:reset_password_url]
    }

    body = mandrill_template(opts[:template], message)
    send_mail(opts[:email], opts[:subject], body)
    rescue Mandrill::Error => e
      Rails.logger.debug("#{e.class}: #{e.message}")
      raise
  end

end
