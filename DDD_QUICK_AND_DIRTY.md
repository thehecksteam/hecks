# Quick and Dirty DDD

<!-- TOC -->

- [Quick and Dirty DDD](#quick-and-dirty-ddd)
  - [Collect Use Cases](#collect-use-cases)
  - [Diagram nouns and relationships](#diagram-nouns-and-relationships)
  - [Find the Entities and Values](#find-the-entities-and-values)
  - [Find the DDD Aggregates and Roots](#find-the-ddd-aggregates-and-roots)
  - [Create Domain](#create-domain)
  - [Add Operations](#add-operations)
  - [Generate Domain](#generate-domain)
  - [Write the Operation](#write-the-operation)
  - [Publish the domain](#publish-the-domain)
  - [Use the domain in an application](#use-the-domain-in-an-application)

<!-- /TOC -->

## Collect Use Cases
- Examples
  - Add a goal to a match
  - Score a match
  - Add a player to a team

## Diagram nouns and relationships
  - Relationships should be unidirectional
  - Nouns should be singular
  - Use an astrisk to specify multiplicity
    - `Match *-> Goal` reads as "A match has many goals"
    - `Match -> Fixture` reads as "A match has a fixture"
    - `Match 2-> Team` reads "A match has two teams

## Find the Entities and Values
  - An Entity 
    - is not defined by its attributes, but rather by a thread of continuity and identity
    - has a unique identity (GUID) that manifests itself in different ways in different systems.  Attributes change but the entity remains
  - A Value
    - no continuity
    - describes characteristics of a thing
    - "Monday" is a value, it
      - never becomes "Tuesday"
      - can be garbage collected without losing history
      - should be immutable, ie, throw away and replace
      - no "life cycles"

## Find the DDD Aggregates and Roots
  - Cluster of domain objects that can be treated as a single unit
  - Is a Domain concepts (order, clinic visit, playlist)
  - One of its component objects be the aggregate root
  - Any references from outside the aggregate should only go to the aggregate root
  - Ensures the integrity of the aggregate as a whole
  - you request to load or save whole aggregates
  - Transactions should not cross aggregate boundaries
  - Differs from a UML Aggregate
  - Operations are only alowed on the root

## Create Domain
  The domain file uses a DSL to mirror the structure of the model.  See [Domainfile](https://github.com/chrisyoung/hecks_domain/blob/master/examples/soccer_season/Domainfile).

  
## Add Operations
Once the aggregates are visualized, add operations to each root.
```ruby
## Find me in a the Domainfile
  root :Match do
    # ...
    operations %i[AddGoal]
  end
```

## Generate Domain
```bash
## From inside of the project directory
$ thor hecks_domain:new

create  domain/matches/root.rb
create  domain/teams/root.rb
create  domain/players/root.rb
create  domain/pitches/root.rb
create  domain/matches/match.rb
create  domain/matches/match/repository.rb
create  domain/matches/match/commands/add_goal.rb
create  domain/matches/result.rb
create  domain/matches/tied_result.rb
create  domain/matches/goal.rb
create  domain/matches/fixture.rb
create  domain/matches/pitch.rb
create  domain/teams/team.rb
# ...
```

## Write the Operation
```ruby
# examples/soccer_season/domain/matches/match/commands/add_goal.rb
module SoccerSeason
  module Domain
    module Matches
      class Match
        module Commands
          class AddGoal
            attr_reader :args, :root, :time, :player
            def initialize(match, args = {})
              @args = args
              @root = match
              @time = args[:time]
              @player = args[:player]
            end

            def call
              tap do |command|
                @root.instance_eval do
                  @goals << Goal.new(time: command.time, player: command.player)
                end
              end
            end
          end
        end
      end
    end
  end
end
```

## Publish the domain
```bash
gem build soccer_season.gemspec
gem install soccer_season-0.1.0.gem
```

## Use the domain in an application
```bash
rails new soccer_season_rails
```

```ruby
# Gemfile
gem 'hecks_app'
gem 'soccer_season'
```

```ruby
# config/initializers/domain.rb
require 'application_port'
require 'soccer_season'

Domain = HecksApp::ApplicationPort

Domain.config do
  domain SoccerSeason
  driver :Dynamodb
end
```

```ruby
# config/routes.rb
Rails.application.routes.draw do
  resources :matches do
  end
end
```

```ruby
# app/controllers/goals_controller.rb
class GoalsController < ApplicationController
  before_action :fetch_match
  before_action :build_goal

  def create
    Domain[@match].add_goal!(device: @goal) do |result|
      result.on_success do
        redirect_to match_url(id: @match.id)
      end
    end
  end

  private

  def build_goal
    @goal = Domain[Matches: :Goal].default(player: { id: args[:player_id] })
  end
end
```