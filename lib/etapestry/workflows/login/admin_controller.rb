module ETapestry
  module Login
    class Admin < BaseController
      @model = AdminModel
      @view = AdminView

      def logout
        @view.logout
      end

      def login
        unless @view.config.loggedin
          @view.login
          populate_data
          if ForceView.lightbox.present? && Watirmark::Configuration.instance.force_login
            Login::Force.new(@model).login
          end
        end
      end

      def submit
        @view.login_button.click
        Watirmark::Configuration.instance.loggedin = true
      end

    end
  end
end
