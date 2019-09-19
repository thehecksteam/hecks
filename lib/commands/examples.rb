# A CLI interface for generating domains
require 'rspec'
class Examples < Thor
  package_name 'Hecks'

  desc 'generate', ''
  def generate
    Dir.chdir 'examples/lean_coffee'
    Hecks.new.new
    Dir.chdir '../..'
  end

  desc 'test', ''
  def test
    Dir.chdir 'examples/lean_coffee'
    RSpec::Core::Runner.run(['spec'])
    Dir.chdir '../..'
  end
end
