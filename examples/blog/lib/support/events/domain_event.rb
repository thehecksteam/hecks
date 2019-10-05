class Support
  module Events
    class DomainEvent
      attr_reader :type, :name, :command, :args, :root
      def initialize(command)
        @command = command
        @root = @command.root
        @type = @command.class
        @name = @type.to_s.underscore
        @args = command.args
      end
    end
  end
end
