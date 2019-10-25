CORE = [
  'hecks-domain',
  { 'adapters/dynamodb' => 'hecks-adapters-dynamodb' },
  'hecks-app',
  'hecks-active_model',
  { 'hecks-rails' => 'hecks_on_rails' }
].freeze

task :default => [:build_core, :install_core]

desc 'build-core'
task :build_core do
  CORE.each do |entry|
    path, gem = path_and_gem(entry)
    puts `cd #{path} && gem build #{gem}`
  end
end

desc 'install-core'
task :install_core do
  CORE.each do |entry|
    path, gem = path_and_gem(entry)
    puts `cd #{path} && gem install #{gem} --no-document`
  end
end

desc 'uninstall-core'
task :uninstall_core do
  CORE.each do |entry|
    path, gem = path_and_gem(entry)
    puts `cd #{path} && gem uninstall #{gem} --force`
  end
end

def path_and_gem(entry)
  return entry, entry unless entry.is_a? Hash
  return entry.keys.first, entry.values.first
end