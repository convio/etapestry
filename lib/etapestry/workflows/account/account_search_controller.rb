module ETapestry
  class AccountSearch < BaseController
    @model = AccountSearchModel
    @view = AccountSearchView

    def search_for_value
      @model.search_term
    end

    def submit
      @view.find_button.click
      @view.account_link(@model.search_term).click
    end
  end
end