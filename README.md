# FannyKy API

Ruby on Rails-based RESTful API serving the React-based front-end at https://github.com/axelmukwena/fannyky.

## Resources
### Docker
- Setting up API with with Docker https://dev.to/joker666/deploy-a-ruby-on-rails-api-only-application-in-docker-with-postgresql-1933

### Solving Authentication

- Currently implemented
  - https://dev.to/kahawaiikailana/rails-api-quickstart-guide-with-postgressql-and-jwt-tokens-3pnk
 

- Devise-JWT, AllowList
  - Devise-JWT https://medium.com/ruby-daily/a-devise-jwt-tutorial-for-authenticating-users-in-ruby-on-rails-ca214898318e

        # Create User    
        $ curl -XPOST -H "Content-Type: application/json" -d '{  "user": {"email": "food@example.com", "password": "12345678"}  }' http://localhost:3000/api/
        
        # Login
        $ curl -XPOST -i -H "Content-Type: application/json" -d '{ "user": { "email": "food@example.com", "password": "12345678" } }' http://localhost:3000/api/login
  
        # Create painting
        $ curl -XPOST -H "Authorization: eyJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjo1MX0.-vW-y1bSKvwBZu_3nuusIOITy7tpKm67KF7x5C4CfXQ" -H "Content-Type: application/json" '{ "painting": {title: "Johny goes fishing", user_id: 48, painter_id: 2} }' http://localhost:3000/api/axel-mukwena/paintings/
  
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

### View Heroku Postgres DB in browser
- https://app.popsql.com/
- How to: https://danielnmai.medium.com/how-to-set-up-postico-3-to-connect-to-a-remote-postgresql-server-heroku-f9704e1b7643

### Rake
      
    $ rake db:drop && rake db:create && rake db:migrate
    $ heroku pg:reset

### Generate new slug on slugged change
- https://stackoverflow.com/a/38449957/8050183

### Group types
- Only Buda require group type, fanny uses date groupings
- group_type: Creative Works, Landscapes in Japan, Sketches with Themes

### Kill all rails server

```
killall -9 ruby
```