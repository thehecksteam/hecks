class Hecks < Thor
  package_name 'Hecks'
  HECKS_FILE_NAME = 'Domainfile'.freeze

  desc 'new', 'Create a new domain'
  method_option :overwrite_commands, type: :boolean, aliases: '-o'
  def new
    unless File.file?(HECKS_FILE_NAME)
      puts 'Missing Domainfile - are you in a domain project?'
      return
    end

    instance_eval(File.open(HECKS_FILE_NAME).read).tap do |domain|
      domain.build
      domain.dump
    end
  end
end

