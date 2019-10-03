class Hecks < Thor
  package_name 'Hecks'
  HECKS_FILE_NAME = 'Domainfile'.freeze

  desc 'generate', 'Generate a domain from a Domainfile'
  subcommand 'generate', HecksDomain::Commands::Generate
end
