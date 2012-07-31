dir = File.join(File.dirname(__FILE__))
$: << File.expand_path("#{dir}/../../lib")
$: <<  File.expand_path(dir)

require 'etapestry'
require 'watirmark/cucumber/env'

Watirmark::Configuration.instance.bypass_admin_login = false

include ETapestry

at_exit {
  LoginView.logout_link.click if LoginView.logout_link.present?
}