<!-- TOC -->

- [New](#new)
- [In Progress](#in-progress)
- [Bugs](#bugs)
- [HecksOnRails](#hecksonrails)
- [General](#general)
- [Hecks](#hecks)

<!-- /TOC -->

# New
* create scaffold for hecks
* add pry to everything
* How to do unique checks such as on team.name?
* generate support files on `hecks generate new`
* hecks console - loads the current domain in IRB
* Dont let nil override default values
* Add an examples project
* Add an adapters project
* Add a plugins project that includes hecks_activemodel
* Blow up if a Domain Version isn't supplied on generation
* `hecks new` generates a Domainfile if one doesn't already exist

# In Progress
* Command Contexts

# Bugs
* DOMAIN_SCHEMA.as_json results in infinate loop
* id reader is being added twice when generating entities

# HecksOnRails
  * Easy admin interface
  * /hecks_domain shows domain info

# General
1. Add License File to all the projects
1. Setup metrics
1. Test everything
1. Should I use pizzeria for all the examples?
1. Add Pizzeria to the build

# Hecks
1. Stay in the hecks project root and run all helpful dev tools from there.
1. /Projects > hecks domain new

1. Best way to run specs in ci?
1. Rename
  * hecks/hecks-domain > hecks/domain
  * hecks/hecks-app > hecks/app
 ```ruby
  Hecks::App.config do 
    Domain.config do
    # ...
    adapter :ActiveModel
  end
```

# Hecks ActiveModel
1. hecks/hecks-active_model > hecks/app/adapters/active_model
  
1. Create a test app

# App
```ruby
  Domain[:AddParticipantToMeeting].with do
    participant: <participant>,
    meeting: { id: 123456 }
  end
```

1. Name Change: Hecks::App
1. Work on nicer API for DOMAIN_SCHEMA
1. What does a data port look like?
1. Make a Logger Driven Adapter
1. Dynamic SQL Adapter
1. Lambda Adapter
1. Value Store
1. Generate a CRUD server (or make a generic one)
1. Make a Command Bus
1. Create a facilitator app
1. Generate and test Pizzeria

# Domain
1. Commands to generate factories, queries, services, etc
1. Stop Referencing parents in the schema, ie domain_object should know nothing about aggregate
1. Basic types in lists
1. Default Values
1. Use build factories in tests instead of default
1. Option to overwrite commands
1. Clean up filemaker
1. Clean up event handlers to make more sense
1. Break DomainObject template into Entity and Value
1. Generate spec files for commands
1. Generate initial Readme based on Domainfile
1. Values are immutable, so provide equality
1. Hecks Domain Version in Domainfile
1. Rewind commands
1. Replay commands
1. Generate a Java Domain

# Rails
1. Generate Rails initializer

# Lean Coffee
1. Should be able to vote more than once for the same topic
1. Delete Timer Service
