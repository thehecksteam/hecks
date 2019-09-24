require_relative 'hecks/examples'
require_relative 'hecks/gems'
require_relative 'hecks/ci'
require_relative 'hecks/adapters'
require_relative 'hecks/app'
require_relative 'hecks/active_model_commands'
require_relative 'hecks/domain_commands'


# A CLI interface for generating domains
class Hecks < Thor
  desc 'gem', 'build and install gems'
  subcommand 'gem', Gems

  desc 'examples', 'test the examples'
  subcommand 'examples', Examples

  desc 'ci', 'build and test everything'
  subcommand 'ci', CI

  desc 'adapters', 'test the adapters'
  subcommand 'adapters', Adapters

  desc 'app', 'test the app'
  subcommand 'app', App

  desc 'domain', 'test the domain'
  subcommand 'domain_commands', DomainCommands

  desc 'active_model', 'build and test active_model'
  subcommand 'active_model_commands', ActiveModelCommands
end
