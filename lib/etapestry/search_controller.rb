module ETapestry
  class SearchController < BaseController

    def current_record_visible?
      raise "Method needs to be defined in the subclass and return a true/false value"
    end

    def populate_data
      super unless current_record_visible?
    end
  end
end