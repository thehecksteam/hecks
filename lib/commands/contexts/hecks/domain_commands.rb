require 'rspec'
class DomainCommands < Thor
  package_name 'Hecks'

  desc 'test', ''
  def test
    puts `cd hecks-domain && rspec`
  end
end
