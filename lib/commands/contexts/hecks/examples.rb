# A CLI interface for generating domains
require 'rspec'
class Examples < Thor
  package_name 'Hecks'

  desc 'generate', ''
  def generate
    require_relative '../domain'
    Dir.chdir 'examples/lean_coffee'
    Hecks.new.generate
    Dir.chdir '../..'
    Dir.chdir 'examples/soccer_season'
    Hecks.new.generate
    Dir.chdir '../..'
  end

  desc 'test', ''
  def test
    Dir.chdir 'examples/lean_coffee'
    RSpec::Core::Runner.run(['spec'])
    Dir.chdir '../..'
    Dir.chdir 'examples/soccer_season'
    puts `rspec`
    Dir.chdir '../..'
  end
end
