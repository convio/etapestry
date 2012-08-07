module ETapestry
  module Account
    class Header < BaseController
      @model = HeaderModel
      @view = HeaderView
      @search = Search

      def verify_address
        assert !!(@view.address.text =~ /#{@model.address}/)
      end
    end
  end
end

