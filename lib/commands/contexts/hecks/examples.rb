# A CLI interface for generating domains
require 'rspec'
require_relative '../domain'

class Examples < Thor
  EXAMPLES = %w[soccer_season lean_coffee].freeze
  package_name 'Hecks'

  desc 'generate', ''
  def generate
    EXAMPLES.each do |example|
      Dir.chdir "examples/#{example}"
      HecksDomain::Commands::Generate.new(
        [:domain_from_domain_file]
      ).invoke_all
      Dir.chdir '../..'
    end
  end

  desc 'test', ''
  def test
    EXAMPLES.each do |example|
      Dir.chdir "examples/#{example}"
      puts `rspec`
      Dir.chdir '../..'
    end
  end
end
