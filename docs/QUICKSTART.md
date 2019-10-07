# Hecks Quick Start Guide
This quickstart guide will show you how to create a simple domain using Hecks, configure the domain to use dynamodb, and use it with Rails.
# Prerequisites
### Install Dynamodb local and dynamodb admin
* https://hub.docker.com/r/amazon/dynamodb-local
* https://github.com/aaronshaf/dynamodb-admin

## 1. Create a new project
```bash
hecks new new Blog
```
This creates a new directory called foo with a Domainfile in it.
## 2. Define the domain
```ruby
# foo/Domainfile
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
This defines a `domain` called foo with an `aggregate` called Bars, and a `root` called Bar with a name `field` and a single `operation` called UpdateName

## 3. Test drive the operation (optional)

```ruby
# spec/bars/bar_spec.rb
require 'spec_helper'

describe Blog::Domain::Bars::Bar do
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
`#instance_eval` is used here because the domain object is immutable except through operations.  Setting `args = @args` is necessary for the instance eval block to see the args.

Running rspec should pass now.

## 5. Generate a Rails project
```bash
rails new blog_rails
```

## 6. Add the domain and hecks libraries to the Gemfile
```ruby
# blog_rails/Gemfile
gem 'blog', path: '../blog'
gem 'hecks-active_model', '0.1.0'
gem 'hecks-adapters-dynamodb', '0.1.0'
```
then..
```bash
bundle
```

## 7. Configure the application
```ruby
# blog_rails/config/initializers/domain.db
require 'hecks-adapters/dynamodb'
Domain = HecksApp::ApplicationPort
Domain.config do
  domain Blog
  adapter :Dynamodb
end
Hecks::ActiveModel.decorate
```

## 8. Create a resource
```bash
rails generate scaffold users/user --no-migration -o false
```

## 9. Add a `#new` method to the controller
```ruby
# blog_rails/app/controllers/users/users_controller.rb
class Users::UsersController < ApplicationController
  def new
    @users_user = Domain[Users: :User].build(name: nil)
  end
end
```

## 11. Add a `#create` method to the controller
```ruby
# blog_rails/app/controllers/bars/bar_controller.rb
class Bars::BarsController < ApplicationController
  # ...
  def create
    @users_user = Domain[Users: :User].build(users_user_params.to_h.symbolize_keys)

    respond_to do |format|
      if Domain[@users_user].save
        format.html { redirect_to @users_user, notice: 'User was successfully created.' }
        format.json { render :show, status: :created, location: @users_user }
      else
        format.html { render :new }
        format.json { render json: @users_user.errors, status: :unprocessable_entity }
      end
    end  
  end
end
```

## 12. Add a `#show` method to the controller
```ruby
def index
  @users_users = Domain[Users: :User].all
end
```