require 'watirmark/loader'
module ETapestry
  class Loader
    class << self
      @@loaded = {}

      def load_product(*names)
        [*names].each {|name| names.delete(name) if @@loaded[name]}
        load_files names, '*{_view}.rb'
        load_files names, '*{_model}.rb'
        load_files names, '*{_controller}.rb'
        load_files names, '*.rb'
        [*names].each {|name| @@loaded[name] = true}
      end
      alias :load_products :load_product

      def load_files(names, files)
        [*names].each do |name|
          Watirmark.loader do
            base_directory File.dirname(__FILE__) + "/workflows/#{name}"
            product 'ETapestry'
            if $AUTOLOAD
              if files =~ /_model|_sql|_api/
                load_files files
              else
                autoload_crm_files files
              end
            else
              load_files files
            end
          end
        end
      end
      private :load_files

    end

  end
end
