# FannyKy API

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...

# Resources
- Setting up API with with Docker https://dev.to/joker666/deploy-a-ruby-on-rails-api-only-application-in-docker-with-postgresql-1933
- Devise-JWT https://medium.com/ruby-daily/a-devise-jwt-tutorial-for-authenticating-users-in-ruby-on-rails-ca214898318e
- More JWT https://medium.com/@brentkearney/json-web-token-jwt-and-html-logins-with-devise-and-ruby-on-rails-5-9d5e8195193d

### Solving Authentication Devise-JWT, AllowList
- https://www.programmingtil.com/contents/setting-up-jwts-in-ruby-on-rails-with-devise-jwt
- https://github.com/davidwparker/programmingtil-rails/tree/ep3

### Disable registerable in users to only allow invitations
- https://github.com/scambra/devise_invitable

## Nano

    $ EDITOR=nano rails credentials:edit

 After editing, then:
 `ctrl+x`, then `y`, then `enter` to close and save if you’re using the nano editor.
