class UserMailer < BaseMandrillMailer
  def welcome(user_id)
    user = User.find(user_id)
    subject = "Welcome to GetReal!"
    merge_vars = {
      "FIRST_NAME" => user.first_name,
      "DASHBOARD_URL" => dashboard_url(user.dashboard),
    }
    body = mandrill_template("welcome", merge_vars)

    send_mail(user.email, subject, body)
  end
end
