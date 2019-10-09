<!-- TOC -->

- [Sprint - Rails](#sprint---rails)
- [Sprint - Production Release: 0.2.0](#sprint---production-release-020)
- [Sprint - Development Environment](#sprint---development-environment)
- [Sprint - Domain improvement](#sprint---domain-improvement)
- [Sprint - Adapters](#sprint---adapters)
- [Notes](#notes)

<!-- /TOC -->

# Sprint - Rails
1. Rails generate hecks scaffold [hecks_on_rails]
1. Generate Rails initializer [hecks-on-rails]
1. Hecks/hecks-active_model > hecks/app/plugins/active_model [active-model]

# Sprint - Production Release: 0.2.0
1. Add License File to all the projects [general]
1. Setup metrics [general]
1. Rename [hecks]
1. Name Change: Hecks::App [app]
1. Generate initial Readme based on Domainfile [domain]
1. Generate and test Pizzeria [app]
1. Hecks Domain Version in Domainfile [domain]

# Sprint - Development Environment
1. Add pry to everything [general]
1. Use build factories in tests instead of default [domain]
1. Stop Referencing parents in the schema, ie domain_object should know nothing about aggregate [domain]
1. Clean up event handlers to make more sense [domain]
1. Values are immutable, so provide equality [domain]
1. DOMAIN_SCHEMA.as_json results in infinate loop [bug]
1. ID reader is being added twice when generating entities [bug]

# Sprint - Domain improvement
1. Default Values [domain]
1. Basic types in lists [domain]
1. Blow up if a Domain Version isn't supplied on generation [domain]
1. Pass directroy into generators so we don't have to `cd <directory>` [domain]
1. How to do unique checks such as on team.name [domain]

# Sprint - Adapters
1. Hecks console - loads the current domain in IRB [app]
1. Lambda Adapter [app]

# Notes
```ruby
  Domain(:AddParticipantToMeeting)
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
1. Best way to run specs in ci? [hecks]
1. Work on nicer API for DOMAIN_SCHEMA [app]
1. What does a data port look like? [app]