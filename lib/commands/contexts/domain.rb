class Hecks < Thor
  package_name 'Hecks'
  HECKS_FILE_NAME = 'Domainfile'.freeze

  desc 'generate', 'Generate a domain from a Domainfile'
  method_option :overwrite_commands, type: :boolean, aliases: '-o'
  def generate
    instance_eval(File.open(HECKS_FILE_NAME).read).tap do |domain|
      domain.build
      domain.dump
    end
  end
end

