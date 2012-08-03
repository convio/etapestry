module ETapestry
  class SearchController < BaseController
    def populate_data
      super unless current_record_visible?
    end
  end
end