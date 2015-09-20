heroku ps:scale worker=1
web: bundle exec puma
worker: bundle exec sidekiq -q default -q mailer -q shares
