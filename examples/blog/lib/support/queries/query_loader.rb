class Support
  module Queries
    module QueryLoader
      def self.included(base)
        return unless base.constants.include?(:Queries)
        base::Queries.constants.each do |constant|
          raise "Query name `#{constant}` not valid.  Query classes must start with 'Find'" unless constant.to_s.underscore =~ /^find_.*/
          
          base.class_eval "
            def #{constant.to_s.underscore}(*args, &block)
              Queries::#{constant}.query(self, *args)
            end
          "
        end
      end
    end
  end
end
