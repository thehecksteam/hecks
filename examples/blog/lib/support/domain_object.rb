class Support
  module DomainObject
    TYPES = %w[services invariants factories].freeze

    LOADERS = [
      Support::Factories::FactoryLoader, Support::Invariants::InvariantLoader
    ].freeze

    def self.included(base)
      path = [
        '../../domain',
        base.to_s.split('::')[-2].underscore.downcase,
        base.to_s.split('::')[-1].underscore.downcase
      ].join('/')

      TYPES.each do |name|
        Dir[File.dirname(__FILE__) + "/#{path}/" + name + '/*.rb'].each do |file|
          require_relative file
        end
      end

      LOADERS.each { |loader| base.include(loader) }
    end
  end
end
