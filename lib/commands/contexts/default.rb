class Hecks < Thor
  package_name 'Hecks'
  HECKS_FILE_NAME = 'Domainfile'.freeze

  desc 'new', 'Create a new domain project'
  subcommand 'new', HecksDomain::Commands::Generate
end
