module ETapestry
  class AccountSearch < BaseController
    @model = AccountSearchModel
    @view = AccountSearchView

    def populate_data
      super
      @view.select(@model.search_for).click
    end

    def submit
      @view.find_button.click
    end
  end
end