module ETapestry
  module Account
    class Search < SearchController
      @model = SearchModel
      @view = SearchView

      def search_for_value
        @model.search_term
      end

      def current_record_visible?
        headerview = HeaderView.new
        headerview.header.present? &&
        headerview.name.exists? &&
        headerview.name.text == @model.search_term
      end

      def submit
        @view.find_button.click
        @view.account_link(@model.search_term).click
      end
    end
  end
end