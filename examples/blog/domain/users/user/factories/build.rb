module Blog
  module Domain
    module Users
      class User
        module Factories
          # Recursively build domain objects.  Used in the domain as the primary
          # factory. The results of #build can be passed to any other build
          # factory in the domain. Takes a hash, or a list of hashes.  If a list
          # is given, it will return a list of the instantiated objects
          class Build
            def self.factory(args=nil)
              return args if args.nil?
              return args unless args.is_a?(Hash)

              [args].flatten.map do |domain_object_args|
                new_domain_object(domain_object_args)
              end.tap do |result|
                return result.first unless args.is_a?(Array)
              end
            end

            def self.new_domain_object(args)
              User.new(
                args.merge(
                )
              )
            end
          end
        end
      end
    end
  end
end