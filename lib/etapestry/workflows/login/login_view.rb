module ETapestry
  class LoginView < BaseView
    keyword(:username)      {browser.text_field(:name, 'j_username')}
    keyword(:password)      {browser.text_field(:name, 'j_password')}
    keyword(:force)         {browser.checkbox(:name, 'force')}
    keyword(:login_button)  {browser.button(:value, 'Login')}
    keyword(:logout_link)   {toolbar.link(:text, 'Logout')}

    class << self
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