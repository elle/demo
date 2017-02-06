# Demo Rails App

Some of the CLI commands that were used to create this demo app:

```
rails new demo --skip-spring --skip-turbolinks --skip-test-unit --skip-bundle
cd demo
touch .ruby-version
echo "2.3.0" > .ruby-version
bundle
rails g simple_form:install
touch .gitignore
rails g rspec:install
bundle binstubs rspec-core
rails g delayed_job:active_record
rake db:migrate
mkdir spec/features
touch spec/features/.keep
rails g model user email password_digest token confirmed_at:datetime
rake db:migrate
rails g mailer user_mailer invite
rails g job send_new_user_invitation
```

Majority of this setup is based on https://github.com/thoughtbot/suspenders

You should just use Suspenders
