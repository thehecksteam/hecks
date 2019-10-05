class Support
  module Commands
    module CommandRunner
      def self.run(command, &block)
        Events::DomainEventPublisher.emit(
          const_get(command.class.to_s.split('::')[0])::
            Events::CommandWillRun.new(command)
        )

        command.call
        command.root.test_invariants(command)
        Events::DomainEventPublisher.emit(command, &block)
        command
      end
    end
  end
end
