module ETapestry
  class LoginView < Watirmark::Page
    keyword(:username)      {browser.text_field(:name, 'j_username')}
    keyword(:password)      {browser.text_field(:name, 'j_password')}
    keyword(:login_button)  {browser.button(:value, 'Login')}
    keyword(:logout_link)   {browser.link(:text, 'Logout')}

    class << self
      def config
        Watirmark::Configuration.instance
      end

      def home(model=nil)
        Page.browser.goto("https://#{config.hostname}/prod/Login.jsp?application=enum.applicationType.etapestry")
      end
      alias :create :home


      def logout
        logout_link.click if logout_link.present?
      end

    end
  end
end