class Support
  module Root
    TYPES = %w[commands services invariants queries events subscribers].freeze

    LOADERS = [
      Support::Commands::CommandLoader, Support::Queries::QueryLoader,
      Support::Repositories::RepositoryLoader
    ].freeze

    def self.included(base)
      path = [
        '../../domain',
        base.to_s.split('::')[-2].underscore.downcase,
        base.to_s.split('::')[-1].underscore.downcase
      ].join('/')

      require_relative path + '/repository'

      TYPES.each do |name|
        Dir[File.dirname(__FILE__) + "/#{path}/" + name + '/*.rb']
          .each { |file| require_relative file }
      end

      LOADERS.each { |loader| base.include(loader) }
    end
  end
end
