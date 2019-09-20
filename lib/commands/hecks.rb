# A CLI interface for generating domains
class Hecks < Thor
  desc 'gem', 'commands to build the gem'
  subcommand 'gem', Gems

  desc 'examples', 'commands to support building and testing with examples'
  subcommand 'examples', Examples

  desc 'ci', 'build and test things'
  subcommand 'ci', CI

  desc 'adapters', 'commands to support building and testing with examples'
  subcommand 'adapters', Adapters

  desc 'app', 'commands to support building and testing app'
  subcommand 'app', App

  desc 'domain', 'commands to support building and testing domain'
  subcommand 'domain_commands', DomainCommands

  desc 'active_model', 'commands to support building and testing active_model'
  subcommand 'active_model_commands', ActiveModelCommands
end