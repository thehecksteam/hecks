Dir[File.dirname(__FILE__) + '/subscribers/*.rb'].each { |file| require_relative file }
module Blog
  module Domain
    module Users
      class User
        module Subscribers
        end
      end
    end
  end
end
