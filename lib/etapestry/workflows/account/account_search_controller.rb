module ETapestry
  class AccountSearch < SearchController
    @model = AccountSearchModel
    @view = AccountSearchView

    def search_for_value
      @model.search_term
    end

    def current_record_visible?
      AccountHeaderView.header.present? &&
      AccountHeaderView.name.exists? &&
      AccountHeaderView.name.text == @model.search_term
    end

    def submit
      @view.find_button.click
      @view.account_link(@model.search_term).click
    end
  end
end