require 'hecks-adapters/dynamodb'

Domain = HecksApp::ApplicationPort
Domain.config do
  domain  Blog
  adapter :Dynamodb
end
