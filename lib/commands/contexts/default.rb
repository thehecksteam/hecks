class Hecks < Thor
  package_name 'Hecks'
  HECKS_FILE_NAME = 'Domainfile'.freeze

  desc 'new DOMAIN_NAME', 'Create a new domain project'
  def new(domain_name)
    HecksDomain::Generators::Domain.new([domain_name]).invoke_all
  end
end
