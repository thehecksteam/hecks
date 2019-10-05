require_relative 'events/domain_event_publisher'
require_relative 'events/domain_event'

class Support
  module Events
    def self.subscribe(subscriber)
      DomainEventPublisher.subscribe(subscriber)
    end

    def self.cancel_subscription(subscriber)
      DomainEventPublisher.cancel_subscription(subscriber)
    end
  end
end