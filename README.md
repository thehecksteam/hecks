# Hecks

Hecks is a suite of tools for developing Domains and using them with Hexagonal Architecture. The goal is to lower the barrier to using these methodologies and to deliver changeable, testable, maintainable code quickly!

<!-- TOC -->

- [Hecks](#hecks)
  - [Usage](#usage)
  - [Generating your Domain](#generating-your-domain)
    - [Quick Start](#quick-start)
  - [Building and Testing Hecks](#building-and-testing-hecks)
- [Examples](#examples)
  - [Soccer Season](#soccer-season)
  - [Lean Coffee](#lean-coffee)
  - [Lean Coffee Rails](#lean-coffee-rails)
- [Resources](#resources)
  - [Quick and Dirty DDD](#quick-and-dirty-ddd)
  - [Ubiquitous Language Overview](#ubiquitous-language-overview)

<!-- /TOC -->

## Usage
`> gem install hecks`

## Generating your Domain
### Quick Start
1. Write a domain file
1. Generate a domain
1. Write a command
1. Publish the domain as a gem
1. Configure and use a storage adapter
1. Use the domain in a Rails App

## Building and Testing Hecks

The `ci` command will build and test all of the projects.  
  * Builds the gems
  * Install the gems locally
  * Generates examples
  * Runs the tests in all the projects

`> hecks ci`

Default command for `hecks ci all`, which runs the following commands:   `gems build`, `gems install`, `examples generate`, `examples test`, `adapters test`, `app test`, `domain test`, `active_model test`


# Examples
These examples exercise the DDD concepts.  They are working apps that you can review to understand how Hecks works
## [Soccer Season](https://github.com/thehecksteam/hecks-examples-soccer_season)
A domain that describes soccer matches that could be used to publish fixtures
## [Lean Coffee](https://github.com/thehecksteam/hecks-examples-lean_coffee)
A domain that describes the agile meeting format called lean coffee
## [Lean Coffee Rails](https://github.com/thehecksteam/hecks-examples-lean_coffee_rails)
A rails app that uses the lean coffee domain and the dynamodb adapter to present an interface to users

# Resources
## [Quick and Dirty DDD](/DDD_QUICK_AND_DIRTY.md)
DDD from Hecks perspective
## [Ubiquitous Language Overview](https://blog.carbonfive.com/2016/10/04/ubiquitous-language-the-joy-of-naming/)
Carbon Five's blogpost about how Ubiquitous Language works in their company
