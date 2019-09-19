# A CLI interface for generating domains
class CI < Thor
  package_name 'Hecks'
  default_task :all

  desc 'gems', ''
  def gems
    Gems.new.tap do |gems|
      gems.build
      gems.install
    end
  end

  desc 'examples', ''
  def examples
    Examples.new.tap do |examples|
      examples.generate
      examples.test
    end
  end

  desc 'adapters', ''
  def adapters
    Adapters.new.test
  end

  desc 'app', ''
  def app
    App.new.test
  end

  desc 'domain', ''
  def domain
    DomainCommands.new.test
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
