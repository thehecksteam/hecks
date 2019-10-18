# Hecks Quick Start Guide
This quickstart guide will show you how to create a simple domain using Hecks, configure the domain to use dynamodb, and use it with Rails.
# Prerequisites
### Install Dynamodb local
* https://hub.docker.com/r/amazon/dynamodb-local

## 1. Create a new project
```bash
hecks new Blog
```
This creates a new directory called blog with a Domainfile in it.
## 2. Define the domain and generate files
```ruby
# blog/Domainfile
domain :Blog do
  #...
  aggregate :Users do
    root :User do
      string :name
      operations [:UpdateName]
    end
  end
end
```
This defines a `domain` called foo with an `aggregate` called Bars, and a `root` called Bar with a `field` called `name` and a single `operation` called `UpdateName`.

```bash
hecks generate domain
```

## 3. Test the operation (optional)

```ruby
# spec/users/user_spec.rb
require 'spec_helper'

describe Blog::Domain::Users::User do
  subject { described_class.new(name: 'Frog') }
  describe '#update_name' do
    it do
      subject.update_name!(name: 'Dog')
      expect(subject.name).to eq('Dog')
    end
  end
end
```
This test will fail because we haven't implemented the `#update_name!`

## 4. Implement `#update_name!`
```ruby
class UpdateName
  attr_reader :root, :args

  def initialize(root, args={})
    @root = root
    @args = args
  end

  def call
    args = @args
    @root.instance_eval do
      @name = args[:name]
    end
  end
end
```
`#instance_eval` is used here because the domain object is immutable except through operations.  Commands are allowed to change state, but have to do this trick. Setting `args = @args` is necessary for the instance eval block to see the args.

Running rspec should pass now.

## 5. Build and install the gem
```bash
  gem build blog.gemspec
  gem install blog-0.0.1.gem
```

## 6. Generate a Rails project
Create a new rails project in a location other than the domain project you just created.
```bash
rails new blog_rails --skip-spring
```
Currently Hecks on Rails generators are not compatible with Spring Preloader, thus, `--skip-spring`

## 7. Add the domain and hecks libraries to the Gemfile
```ruby
# blog_rails/Gemfile
gem 'pry'
gem 'blog', '0.0.1'
gem 'hecks_on_rails', '0.1.0'
gem 'hecks-adapters-dynamodb', '0.1.0'
```
then..
```bash
bundle
```

## 8. Configure the application
```
rails g hecks:domain
```
Creates: 
```ruby
# blog_rails/config/initializers/domain.rb
require 'hecks-adapters/dynamodb'

Domain = HecksApp::ApplicationPort
Domain.config do
  domain  Blog
  adapter :Dynamodb
end
```
The generator made note that we included the dynamodb adapter and the blog domain.

## 9. Create a scaffold
```bash
rails g hecks:scaffold users/user
```
Generates the artifacts as `rails scaffold` with tweaks to support our domain.  Will automatically add fields from the domain schema

## 10. Update edit to use our `#update_name` method
```ruby
# app/controllers/users/users_controller.rb

def update
  @users_user.update_name!(name: users_user_params[:name])
  if @users_user.save
    redirect_to @users_user, notice: 'User was successfully updated.'
  else
    render :edit
  end
end
```
Replace the generated edit method with the one above.


## 11. Start the server and create a user
```bash
rails s
```
In your browser, visit `localhost:3000/users/users` and create a new user.

## Conclusion

That's it! We created a domain, injected a DynamoDB Repository and used Rails to create a new user.  Not bad.