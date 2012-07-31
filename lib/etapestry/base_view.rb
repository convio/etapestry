module ETapestry
  class BaseView < Watirmark::Page
    class << self
      def toolbar
        browser.frame(:name, "toolbar")
      end

      def navbar
        browser.frame(:name, "navbar")
      end

      def content
        browser.frame(:name, "content")
      end
    end
  end
end