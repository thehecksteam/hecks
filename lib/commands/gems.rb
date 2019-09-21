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
    puts `cd examples/lean_coffee && gem build lean_coffee`
    puts `cd hecks-active_model && gem build hecks-active_model`
  end

  desc 'install', ''
  def install
    puts `gem install --no-document *.gem`
    puts `cd hecks-domain && gem install --no-document *.gem`
    puts `cd hecks-app && gem install --no-document *.gem`
    puts `cd adapters/dynamodb && gem install --no-document *.gem`
    puts `cd examples/soccer_season && gem install --no-document *.gem`
    puts `cd examples/lean_coffee && gem install --no-document *.gem`
    puts `cd hecks-active_model && gem install --no-document *.gem`
  end
end
