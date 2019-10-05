class Support
  module Commands
    module CommandLoader
      def self.included(base)
        return unless base.constants.include?(:Commands)
        base::Commands.constants.each do |constant|
          base.class_eval "
            def #{constant.to_s.underscore}!(*args, &block)
              Support::Commands::CommandRunner.run(
                Commands::#{constant}.new(self, *args), &block
              )
            end
          "
        end
      end
    end
  end
end
