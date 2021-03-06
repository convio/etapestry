require 'rubigen'
require 'active_support/inflector'
require_relative 'rbeautify'

class MvcGenerator < RubiGen::Base
  attr_reader :product, :name

  def initialize(runtime_args, runtime_options = {})
    super
    usage if args.empty?
    @product = args.shift
    @name = args.shift
    usage unless @name && @product
    @destination_root = File.expand_path(File.dirname(__FILE__) + '/../../')
    extract_options
  end

  def workflow_directory
    "lib/etapestry/workflows/#{@product}"
  end

  def manifest
    record do |m|
      create_directories(m)
      add_mvc_stubs m
      # Need to fix these so they don't add multiple times
      add_loader
      add_rake_task
    end
  end

  def add_mvc_stubs m
    m.template "model.rb.erb", File.join(workflow_directory, "#{@name}_model.rb")
    m.template "view.rb.erb", File.join(workflow_directory, "#{@name}_view.rb")
    m.template "controller.rb.erb", File.join(workflow_directory, "#{@name}_controller.rb")
    m.template "loader.rb.erb", File.join(workflow_directory, "loader.rb")
  end

  def workflow_exists?
    File.directory? "../#{workflow_directory}"
  end

  def add_rake_task
    append_to_file "../rakefile.rb" do |f|
      f.puts "\nRakeHelper.cucumber_task(:#{@product}, \"features/#{@product}/**/*.feature\")"
    end
  end

  def add_loader
    append_to_file "../lib/etapestry.rb" do |f|
      f.puts "require 'etapestry/workflows/#{@product.downcase}/loader'"
    end
  end

  def append_to_file name, &block
    File.open(name, 'a+') { |f| yield f }
  end

  def create_directories(m)
    m.directory workflow_directory
  end

  def create_modules
    @product.split('/').map { |x| "module #{x.camelize}\n" }.join.strip
  end

  def create_module_end
    @product.split('/').map { |x| "end\n" }.join.strip
  end

  protected
  def banner
    <<-EOS
USAGE: #{spec.name} path/for/your/test/mvc workflow_directory name [options]
    EOS
  end

  def after_generate
    mvc_file_path = "#{@destination_root}/#{workflow_directory}/#{@name}"
    RBeautify.new({}).beautify_file("#{mvc_file_path}_model.rb")
    RBeautify.new({}).beautify_file("#{mvc_file_path}_view.rb")
    RBeautify.new({}).beautify_file("#{mvc_file_path}_controller.rb")
  end

  def add_options!(opts)
    opts.separator ''
    opts.separator 'Options:'
    # For each option below, place the default
    # at the top of the file next to "default_options"
    # opts.on("-a", "--author=\"Your Name\"", String,
    #         "Some comment about this option",
    #         "Default: none") { |options[:author]| }
    opts.on("-v", "--version", "Show the #{File.basename($0)} version number and quit.")
  end

  def extract_options
    # for each option, extract it into a local variable (and create an "attr_reader :author" at the top)
    # Templates can access these value via the attr_reader-generated methods, but not the
    # raw instance variable value.
    # @author = options[:author]
  end

end