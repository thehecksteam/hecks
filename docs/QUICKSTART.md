# Hecks Quick Start Guide
This quickstart guide will show you how to create a simple domain using Hecks, configure the domain to use dynamodb, and use it with Rails.
# Prerequisites
### Install Dynamodb local and dynamodb admin
* https://hub.docker.com/r/amazon/dynamodb-local
* https://github.com/aaronshaf/dynamodb-admin

## 1. Create a new project
```bash
hecks new Blog
```
This creates a new directory called blog with a Domainfile in it.
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
This defines a `domain` called foo with an `aggregate` called Bars, and a `root` called Bar with a `field` calld `name` and a single `operation` called `UpdateName`.

## 3. Test the operation (optional)

```ruby
# spec/Users/user_spec.rb
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

## 5. Generate a Rails project
```bash
rails new blog_rails --skip-spring
```
Currently Hecks on Rails generators are not compatible with Spring Preloader, thus, `--skip-spring`

## 6. Add the domain and hecks libraries to the Gemfile
```ruby
# blog_rails/Gemfile
gem 'blog', '0.0.1'
gem 'hecks-active_model', '0.1.0'
gem 'hecks-adapters-dynamodb', '0.1.0'
```
then..
```bash
bundle
```

## 7. Configure the application
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

## 8. Create a scaffold
```bash
rails g hecks:scaffold users/user
```
Generates the artifacts as `rails scaffold` with tweaks to support our domain

## 9. Start the server
```bash
rails s
```

## 10. Create a user
In your browser, visit `localhost:3000/users/users/new`

That's it! We created a domain, injected a DynamoDB Repository and used Rails to create a new user.  Not bad.