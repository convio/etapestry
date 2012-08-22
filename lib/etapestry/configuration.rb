require 'watirmark/configuration'
config_path = File.dirname(__FILE__) + '/../..'

Watirmark::Configuration.instance.defaults = {
  :site => "prod",
  :configfile => "#{config_path}/config.txt",
}
Watirmark::Configuration.instance.reload