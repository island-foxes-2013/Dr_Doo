require "yaml"

puts
puts "=========================================================================="
puts "Loading actionmailer_jango_config"
puts "           If errors occur, you may be missing the jango.yml"
puts "                                           This file is not tracked by git"
puts "=========================================================================="
puts

# Load yaml configuration file to use actionmailer with jango
# Jango credentials loaded form SMTP server use
# all_jango_config = YAML.load_file( File.join( Rails.root, 'app', 'config', 'jango.yml' ) )
actionmailer_jango_config = HashWithIndifferentAccess.new(YAML.load(File.read(File.expand_path('../../jango.yml', __FILE__))))
#current_jango_config = all_jango_config[Rails.env] 
#now do something with this current_oauth_config variable

ENV['JANGO_USERNAME'] = actionmailer_jango_config[:development][:username]
ENV['JANGO_PASSWORD'] = actionmailer_jango_config[:development][:password]