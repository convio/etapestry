module ETapestry

  class Login < Watirmark::WebPage::Controller
    @model = LoginModel
    @view = LoginView

    def logout
      @view.logout
    end

    alias :login :create

    def submit
      @view.login_button.click
      @view.config.loggedin = true
      @view.config.username = @model.username
      return
    end

  end
end
