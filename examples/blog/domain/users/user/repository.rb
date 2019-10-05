
module Blog
  module Domain
    module Users
      class User
        class Repository
          include Singleton
          def self.save(object)
            instance.save(object)
          end

          def self.fetch(user)
            instance.fetch(user)
          end

          def initialize
            @objects = {}
          end

          def self.create(user)
            instance.create(user)
          end

          def self.all
            instance.all
          end

          def all
            @objects.values
          end

          def create(user)
            klass = self.class.const_get(
              self.class.to_s.gsub('::Repository', '')
            )
            domain_object = klass.build(user)
            domain_object.tap(&:save)
          end

          def fetch(fetchable)
            return @objects[fetchable.id] if fetchable.respond_to?(:id)

            @objects[fetchable]
          end

          def save(user)
            domain_object = user
            @objects[user.hash] = domain_object

            user.instance_eval do
              @id = user.hash
            end

            user
          end
        end
      end
    end
  end
end