# A CLI interface for generating domains
require 'rspec'
require_relative '../domain'

class Examples < Thor
  EXAMPLES = %w[lean_coffee soccer_season].freeze
  package_name 'Hecks'

  desc 'generate', ''
  def generate
    EXAMPLES.each do |example|
      Dir.chdir "examples/#{example}"
      Hecks.new.generate
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
