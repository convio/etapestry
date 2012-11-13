require 'etapestry/extensions/webdriver_extensions'
require "watir-webdriver/extensions/alerts"
require 'etapestry/views/base_view'
require 'etapestry/controllers/base_controller'
require 'etapestry/controllers/search_controller'
Watirmark.loader do
  base_directory File.dirname(__FILE__)
  product 'ETapestry'
  load_files 'checkers/**/*.rb'
end



