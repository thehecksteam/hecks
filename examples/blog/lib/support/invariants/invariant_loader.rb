class Support
  module Invariants
    module InvariantLoader
      def self.included(base)
        return unless base.constants.include?(:Invariants)
        base::Invariants.constants.each do |invariant|
          base.include base::Invariants.const_get(invariant)
        end
      end

      def test_invariants(command = nil)
        return unless self.class.constants.include?(:Invariants)
        self.class::Invariants.constants.each do |invariant|
          invariant_class = self.class::Invariants.const_get(invariant)
          invariant_class.instance_methods(false).each do |method|
            raise "invariant methods must be prepended with \"invariant_test\".  Try:\n" +
            "#{invariant_class}#invariant_test_#{method.to_s}" unless method.to_s =~ /^invariant.*/
            send(method, command)
          end
        end
      end
    end
  end
end