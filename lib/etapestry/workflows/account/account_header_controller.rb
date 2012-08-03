module ETapestry
  class AccountHeader < BaseController
    @model = AccountHeaderModel
    @view = AccountHeaderView
    @search = AccountSearch

    def verify_address
      assert !!(@view.address.text =~ /#{@model.address}/)
    end
  end
end

