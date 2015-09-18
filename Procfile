heroku ps:scale worker=1
web: rails s
worker: bundle exec sidekiq -q default -q mailer -q shares
