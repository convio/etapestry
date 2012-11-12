module ETapestry
  module Login
    class AdminView < BaseView
      keyword(:username)             {browser.text_field(:name, 'j_username')}
      keyword(:password)             {browser.text_field(:name, 'j_password')}
      keyword(:login_button)         {browser.button(:id, 'loginSubmit')}
      keyword(:logout_link)          {toolbar.link(:text, 'Logout')}

      def config
        Watirmark::Configuration.instance
      end

      def home(model=nil)
        Page.browser.goto("https://#{config.hostname}/#{config.site}/Login.jsp?application=enum.applicationType.etapestry")
      end
      alias :login :home

      def logout
        if logout_link.present?
          logout_link.click
        end
        config.loggedin = false
      end

    end
  end
end