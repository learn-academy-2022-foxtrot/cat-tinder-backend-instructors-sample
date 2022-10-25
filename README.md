# RAILS API

$ rails new cat-tinder-backend-instructors -d postgresql -T
$ cd cat-tinder-backend
$ rails db:create
$ bundle add rspec-rails
$ rails generate rspec:install
<git add remote link >

$ git checkout -b main
$ git add .
$ git commit -m 'initial commit'
$ git push origin main
$ rails server

## Generate Resource

$ rails generate resource Cat name:string age:integer enjoys:text image:text
$ rails db:migrate

## Add Seeds
app/db/seeds.rb
```ruby
cats = [
  {
    name: 'Felix',
    age: 2,
    enjoys: 'Long naps on the couch, and a warm fire.',
    image: 'https://images.unsplash.com/photo-1529778873920-4da4926a72c2?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1036&q=80'
  },
  {
    name: 'Homer',
    age: 12,
    enjoys: 'Food mostly, really just food.',
    image: 'https://images.unsplash.com/photo-1573865526739-10659fec78a5?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1015&q=80'
  },
  {
    name: 'Jack',
    age: 5,
    enjoys: 'Furrrrociously hunting bugs.',
    image: 'https://images.unsplash.com/photo-1492370284958-c20b15c692d2?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1049&q=80'
  }
]

# iterate over array and create each cat with given attributes
cats.each do |each_cat|
  Cat.create each_cat
  puts "creating cat #{each_cat}"
end
```
 $ rails db:seed

 use rails c to check it worked 
 $ rails c
 $ Cat.all

 ## API CORS
 app/controllers/application_controller.rb
```ruby
class ApplicationController < ActionController::Base
  skip_before_action :verify_authenticity_token
end
```

<!-- place this at the bottom of the GEMFILE -->
`gem 'rack-cors', :require => 'rack/cors'`

 <!-- config/initializers create file named cors.rb -->

```ruby
Rails.application.config.middleware.insert_before 0, Rack::Cors do
  allow do
    origins '*'  # <- change this to allow requests from any domain while in development.

    resource '*',
      headers: :any,
      methods: [:get, :post, :put, :patch, :delete, :options, :head]
  end
end
``` 
`$ bundle install`