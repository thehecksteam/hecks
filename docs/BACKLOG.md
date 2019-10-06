<!-- TOC -->

- [New](#new)
- [In Progress](#in-progress)
- [Notes](#notes)

<!-- /TOC -->

# New
* pass directroy into generators so we don't have to `cd [directory]
* create scaffold for hecks
* add pry to everything
* How to do unique checks such as on team.name?
* hecks console - loads the current domain in IRB
* Add a plugins project that includes hecks_activemodel
* Blow up if a Domain Version isn't supplied on generation

# In Progress
1. Generate lean_coffee
1. Create Hecks On Rails project
1. hecks/hecks-active_model > hecks/app/plugins/active_model (active-model)
1. Generate Rails initializer (hecks-on-rails)
1. Add License File to all the projects (general)
1. Add Pizzeria to the build (general)
1. Setup metrics (general)
1. Rename (hecks) * hecks/hecks-domain > hecks/domain, hecks/hecks-app > hecks/app
1. Name Change: Hecks::App (app)
1. Generate initial Readme based on Domainfile (domain)
1. Stop Referencing parents in the schema, ie domain_object should know nothing about aggregate (domain)
1. Use build factories in tests instead of default (domain)
1. Clean up event handlers to make more sense (domain)
1. Values are immutable, so provide equality (domain)
1. DOMAIN_SCHEMA.as_json results in infinate loop (bug)
1. id reader is being added twice when generating entities (bug)
1. Lambda Adapter (app)
1. Generate and test Pizzeria (app)
1. Default Values (domain)
1. Hecks Domain Version in Domainfile (domain)
1. Basic types in lists (domain)

# Notes
```ruby
  Domain[:AddParticipantToMeeting].with do
    participant: <participant>,
    meeting: { id: 123456 }
  end
```

```ruby
  Hecks::App.config do 
    Domain.config do
    # ...
    adapter :ActiveModel
  end
```
1. Best way to run specs in ci? (hecks)
1. Work on nicer API for DOMAIN_SCHEMA (app)
1. What does a data port look like? (app)