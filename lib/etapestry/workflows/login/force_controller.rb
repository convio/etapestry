module ETapestry
  module Login
    class Force < BaseController
      @model = ForceModel
      @view = ForceView

      def login
        populate_data
      end

      def submit
        @view.login_button.when_present.click
        Watirmark::Configuration.instance.loggedin = true
      end

    end
  end
end

