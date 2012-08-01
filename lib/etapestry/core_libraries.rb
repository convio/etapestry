require 'etapestry/extensions/webdriver_extensions'
require "watir-webdriver/extensions/alerts"
require 'etapestry/base_view'
require 'etapestry/base_controller'
Watirmark.loader do
  base_directory File.dirname(__FILE__)
  product 'ETapestry'
  load_files 'checkers/**/*.rb'
end


require 'etapestry/workflows/login'


