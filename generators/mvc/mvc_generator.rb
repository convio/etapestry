require 'rubigen'
class MvcGenerator < RubiGen::Base
  default_options :author => nil
  attr_reader :name

  def initialize(runtime_args, runtime_options = {})
    super
    usage if args.empty?
    @product = args.shift
    @name = args.shift
    @destination_root = File.expand_path(File.dirname(__FILE__) + '/../../')
    extract_options
  end

  def workflow_directory
    "lib/etapestry/workflows/#{@product}"
  end

  def manifest
    record do |m|
      create_directories(m)
      m.template "model.rb.erb", File.join(workflow_directory, "#{@name}_model.rb")
      m.template "view.rb.erb", File.join(workflow_directory,"#{@name}_view.rb")
      m.template "controller.rb.erb", File.join(workflow_directory,"#{@name}_controller.rb")
    end
  end

  def create_directories(m)
    m.directory File.join('lib/etapestry/workflows',@product)
  end

  protected
  def banner
    <<-EOS
USAGE: #{spec.name} path/for/your/test/create_project project_name [options]
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