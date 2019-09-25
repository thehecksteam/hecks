class Hecks < Thor
  package_name 'Hecks'
  HECKS_FILE_NAME = 'Domainfile'.freeze

  desc 'new', 'Create a new domain project with some supporting files.  Especially the Domainfile'
  method_option :domain_name, type: :string, aliases: '-d'
  def new
    puts "Implement me"
  end
end

