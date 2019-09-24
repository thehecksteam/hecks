require 'rspec'
class App < Thor
  package_name 'Hecks'

  desc 'test', ''
  def test
    puts `cd hecks-app && rspec`
  end
end
