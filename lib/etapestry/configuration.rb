require 'watirmark/configuration'
config_path = File.dirname(__FILE__) + '/../..'

if File.exists?("#{config_path}/config.txt")
  configuration_file = "#{config_path}/config.txt"
else
  configuration_file = "#{config_path}/config.yml"
end

Watirmark::Configuration.instance.defaults = {
  :site => "prod",
  :configfile => configuration_file,
}
Watirmark::Configuration.instance.reload