# A CLI interface for generating domains
class Gems < Thor
  package_name 'Hecks'

  desc 'build', ''
  def build
    puts `gem build hecks`
    puts `cd hecks-domain && gem build hecks-domain`
    puts `cd hecks-app && gem build hecks-app`
    puts `cd adapters/dynamodb && gem build hecks-adapters-dynamodb`
    puts `cd examples/soccer_season && gem build soccer_season`
  end

  desc 'install', ''
  def install
    puts `gem install *.gem`
    puts `cd hecks-domain && gem install *.gem`
    puts `cd hecks-app && gem install *.gem`
    puts `cd adapters/dynamodb && gem install *.gem`
    puts `cd examples/soccer_season && gem install *.gem`
  end
end
