module ETapestry
  class AccountFind < BaseController
    @model = AccountFindModel
    @view = AccountFindView

    def search
      @view.search
      populate_data
      @view.select(@model)
    end

    def submit
      @view.find_button.click
    end
  end
end