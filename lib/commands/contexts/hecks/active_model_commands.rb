require 'rspec'
class ActiveModelCommands < Thor
  package_name 'Hecks'

  desc 'test', ''
  def test
    puts `cd hecks-active_model && rspec`
  end
end
