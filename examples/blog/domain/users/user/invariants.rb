Dir[File.dirname(__FILE__) + '/invariants/*.rb'].each {|file| require_relative file }
module Blog
  module Domain
    module Users
      class User
        module Invariants
        end
      end
    end
  end
end