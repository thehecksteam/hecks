# Hecks Quick Start Guide
This quickstart guide will show you how to create a simple domain using Hecks, configure the domain to use dynamodb, and use it with Rails.
# Prerequisites
### Install Dynamodb local and dynamodb admin
* https://hub.docker.com/r/amazon/dynamodb-local
* https://github.com/aaronshaf/dynamodb-admin

## 1. Create a new project
```bash
hecks new new foo
```
This creates a new directory called foo with a Domainfile in it.
## 2. Define the domain
```ruby
# foo/Domainfile
domain :Foo do
  #...
  aggregate :Bars do
    root :Bar do
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

describe Foo::Domain::Bars::Bar do
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
rails new foo_rails
```

## 6. Add the domain and hecks libraries to the Gemfile
```ruby
# foo_rails/Gemfile
gem 'foo', path: '../foo'
gem 'hecks-active_model', '0.1.0'
gem 'hecks-adapters-dynamodb', '0.1.0'
```

## 7. Configure the application
```ruby
# foo_rails/config/initializers/domain.db
require 'hecks-adapters/dynamodb'
Domain = HecksApp::ApplicationPort
Domain.config do
  domain Foo
  adapter :Dynamodb
end
Hecks::ActiveModel.decorate
```

## 8. Create a resource
```bash
rails g resource bars/bar --no-migrations
```

## 9. Add a `#new` method to the controller
```ruby
# foo_rails/app/controllers/bars/bar_controller.rb
class Bars::BarsController < ApplicationController
  def new
    @bar = Domain[Bars: :Bar].build(name: nil)
  end
end
```

## 10. Add a form
```erb
# foo_rails/app/views/bars/bars/new.html.erb
<div class="container">
  <h2>New Bar</h2>
  <%= form_with model: @bar do |form| %>
    <div class="form-group">
      <%= label_tag(:name, "name:") %>
      <%= form.text_field :name, class: "form-control" %>
    </div>
    <%= submit_tag nil, class: 'btn btn-primary' %>
  <% end %>
</div>
```

## 11. Add a `#create` method to the controller
```ruby
# foo_rails/app/controllers/bars/bar_controller.rb
class Bars::BarsController < ApplicationController
  # ...
  def create
    name = params.require(:bars_bar).permit(:name)[:name]
    Domain[Bars: :Bar].build(name: name).save
  end
end
```