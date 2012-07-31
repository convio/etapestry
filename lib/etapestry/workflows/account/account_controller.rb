module ETapestry
  class Account < BaseController
    @model = AccountModel
    @view = AccountView

    def verify_constituent_role
      assert @view.role.text == "Constituent"
    end
  end
end