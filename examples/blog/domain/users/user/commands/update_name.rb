module Blog
  module Domain
    module Users
      class User
        module Commands
          class UpdateName
            attr_reader :root, :args

            def initialize(root, args={})
              @root = root
              @args = args
            end

            def call
              args = @args
              @root.instance_eval do
                @name = args[:name]
              end
            end
          end
        end
      end
    end
  end
end