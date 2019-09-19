# A CLI interface for generating domains
require 'rspec'
class Adapters < Thor
  package_name 'Hecks'

  desc 'test', ''
  def test
    puts `cd adapters/dynamodb && rspec`
  end
end
