

# A CLI interface for generating domains
class CI < Thor
  package_name 'Hecks'
  default_task :all

  desc 'gems', ''
  def gems
    puts 'test gem'
    Gems.new.tap do |gems|
      gems.build
      gems.install
    end
  end

  desc 'examples', ''
  def examples
    puts 'test examples'
    Examples.new.tap do |examples|
      examples.generate
      examples.test
    end
  end

  desc 'adapters', ''
  def adapters
    puts 'test adapters'
    Adapters.new.test
  end

  desc 'app', ''
  def app
    puts 'test app'
    App.new.test
  end

  desc 'domain', ''
  def domain
    puts 'domain'
    DomainCommands.new.test
  end

  desc 'active_model', ''
  def active_model
    puts 'test active model'
    ActiveModelCommands.new.test
  end

  desc 'all', ''
  def all
    gems
    examples
    adapters
    app
    domain
  end
end
