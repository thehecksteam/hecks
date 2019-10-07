require 'rails/generators'
require 'rails/generators/base'

module Hecks
  class DomainGenerator < Rails::Generators::Base
    def create_initializer_file
      create_file(
        'config/initializers/domain.rb',
        <<~DOMAIN_INITIALIZER
          require 'hecks-adapters/dynamodb'
          Domain = HecksApp::ApplicationPort
          Domain.config do
            domain Blog
            adapter :Dynamodb
          end
          Hecks::ActiveModel.decorate
        DOMAIN_INITIALIZER
      )
    end
  end
end
