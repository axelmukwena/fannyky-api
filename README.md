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
### Docker
- Setting up API with with Docker https://dev.to/joker666/deploy-a-ruby-on-rails-api-only-application-in-docker-with-postgresql-1933

### Solving Authentication

- Currently implemented
  - https://dev.to/kahawaiikailana/rails-api-quickstart-guide-with-postgressql-and-jwt-tokens-3pnk
 

- Devise-JWT, AllowList
  - Devise-JWT https://medium.com/ruby-daily/a-devise-jwt-tutorial-for-authenticating-users-in-ruby-on-rails-ca214898318e
  - More JWT https://medium.com/@brentkearney/json-web-token-jwt-and-html-logins-with-devise-and-ruby-on-rails-5-9d5e8195193d
  - Implemented: https://www.programmingtil.com/contents/setting-up-jwts-in-ruby-on-rails-with-devise-jwt
  - https://github.com/davidwparker/programmingtil-rails/tree/ep3

### Disable registerable in users to only allow invitations
- https://gorails.com/forum/new-users-only-created-by-admin-user
- https://github.com/scambra/devise_invitable

### Ploymorphism associations
- https://medium.com/swlh/polymorphic-associations-in-rails-with-example-8375de65510b
- https://guides.rubyonrails.org/association_basics.html#polymorphic-associations

### Editing Nano files

    $ EDITOR=nano rails credentials:edit

 After editing, then:
 `ctrl+x`, then `y`, then `enter` to close and save if you’re using the nano editor.
 
### Processing images with ActiveStorage
 - https://www.microverse.org/blog/how-to-build-an-image-upload-feature-with-rails-and-active-storage

### Serializers
 - https://betterprogramming.pub/how-to-fire-up-a-rails-api-for-your-new-project-6fad595caf07

### Consider UUIDs in the future
- https://pawelurbanek.com/uuid-order-rails

### Categories
- https://www.youtube.com/watch?v=MKtT1TUm7UA&ab_channel=CodeCampBase
- https://github.com/Prometheus88/RailsBlogWithCategories/blob/master/app/controllers/blogs_controller.rb
