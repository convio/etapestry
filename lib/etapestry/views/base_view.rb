module ETapestry
  class BaseView < Watirmark::Page
    def toolbar
      Page.browser.frame(:name, "toolbar")
    end

    def navbar
      Page.browser.frame(:name, "navbar")
    end

    def content
      Page.browser.frame(:name, "content")
    end

    def content_label(name)
      content.td(:text, name).nextsibling
    end

    def home(model)
    end
  end
end