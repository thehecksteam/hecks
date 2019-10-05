Dir[File.dirname(__FILE__) + '/events/*.rb'].each { |file| require_relative file }
module Blog
  module Domain
    module Users
      class User
        module Events
        end
      end
    end
  end
end