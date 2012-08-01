require 'watirmark/loader'
module ETapestry
  class Loader
    class << self
      @@loaded = {}

      def load_product(*names)
        load_workflow(*names, '*')
      end
      alias :load_products :load_product

      def load_workflow(*names, file_pattern)
        load_files names, "#{file_pattern}{_view}.rb"
        load_files names, "#{file_pattern}{_model}.rb"
        load_files names, "#{file_pattern}{_controller}.rb"
        load_files names, "#{file_pattern}.rb"
      end

      def load_files(names, files)
        [*names].each do |name|
          Watirmark.loader do
            base_directory File.dirname(__FILE__) + "/workflows/#{name}"
            product 'ETapestry'
            load_files files
          end
        end
      end
      private :load_files

    end

  end
end
