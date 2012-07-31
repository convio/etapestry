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
        populate_data
      end
    end

    def submit
      @view.login_button.click
      @view.config.loggedin = true
    end

  end
end
