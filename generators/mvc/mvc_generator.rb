require 'rubigen'
require 'active_support/inflector'

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
      unless workflow_exists?
        update_workflow_loader_manifest
        add_rake_task
      end
      add_mvc_stubs m
    end
  end

  def add_mvc_stubs m
    m.template "model.rb.erb", File.join(workflow_directory, "#{@name}_model.rb")
    m.template "view.rb.erb", File.join(workflow_directory,"#{@name}_view.rb")
    m.template "controller.rb.erb", File.join(workflow_directory,"#{@name}_controller.rb")
    m.template "workflow_loader.rb.erb", File.join(workflow_directory, "..", "#{@product}.rb")
  end

  def workflow_exists?
    File.directory? "../lib/etapestry/workflows/#{@product}"
  end

  def update_workflow_loader_manifest
    append_to_file "../lib/etapestry/workflows.rb" do |f|
      f.puts "require 'etapestry/workflows/#{@product}'"
    end
  end

  def add_rake_task
    append_to_file "../rakefile.rb" do |f|
      f.puts "RakeHelper.cucumber_task(:#{@product}, \"features/#{@product}/**/*.feature\")"
    end
  end

  def append_to_file name, &block
    File.open(name, 'a+') {|f| yield f}
  end

  def create_directories(m)
    m.directory workflow_directory
  end

  protected
  def banner
    <<-EOS
USAGE: #{spec.name} path/for/your/test/mvc workflow_directory name [options]
    EOS
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