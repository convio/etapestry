module ETapestry
  class BaseView < Watirmark::Page
    class << self
      def toolbar
        browser.frame(:src, /Toolbar.jsp/)
      end

      def navbar
        browser.frame(:src, /navbar.do/)
      end

      def form
        browser.frame(:src, /welcome.do/)
      end
    end
  end
end