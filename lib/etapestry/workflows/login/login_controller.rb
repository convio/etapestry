module ETapestry

  class Login < BaseController
    @model = LoginModel
    @view = LoginView

    def logout
      @view.logout
    end

    def login
      unless @view.config.loggedin
        @view.login
        begin
          populate_data
        rescue Watirmark::PostFailure=>e
          if Watirmark::Configuration.instance.force_login
            @view.force = true
            populate_data
          else
            raise e
          end
        end
      end
    end

    def submit
      @view.login_button.click
      @view.config.loggedin = true
    end

  end
end
