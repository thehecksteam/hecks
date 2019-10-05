module Blog
  module Events
    class CommandWillRun
      attr_reader :root, :args, :command_to_run
      def initialize(command)
        @root = command.root
        @command_to_run = command
      end
    end
  end
end
