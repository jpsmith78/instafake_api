# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version
    2.6.1
* System dependencies
    bcrypt, rack-cors
* Configuration
    added cors and session_store to config/initializers
* Database creation
    postgres -D /usr/local/var/postgres/
    rails generate migration create_photos
    rails generate migration create_users
    rails db:migrate
* Database initialization
    heroku create heroku_app_name
    heroku run rails db:migrate
* Toggle the admin for a user in heroku
    heroku run rails console
    user.toggle!(:admin)

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...
