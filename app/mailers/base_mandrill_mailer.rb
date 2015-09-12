require "mandrill"

class BaseMandrillMailer < Devise::Mailer
  default(
    from: "coreypsoinos@gmail.com",
    reply_to: "coreypsoinos@gmail.com"
  )

  private

  def send_mail(email, subject, body)
    mail(to: email, subject: subject, body: body, content_type: "text/html")
  end

  def mandrill_template(template_name, attributes)
    merge_vars = attributes.map do |key, value|
      { name: key, content: value }
    end

    mandrill.templates.render(template_name, [], merge_vars)["html"]
  end

  def mandrill
    if Rails.env == "test"
      @_mandrill = Mandrill::API.new(ENV["MANDRILL_TEST_API_KEY"])
    else
      @_mandrill = Mandrill::API.new(ENV["SMTP_PASSWORD"])
    end
  end
end
