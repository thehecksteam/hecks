require_relative 'support'
Dir[File.dirname(__FILE__) + "/../events/*.rb"].each { |file| require_relative file }
require_relative '../domain/users/root'

module Blog
  class InvariantViolationError < StandardError; end
end