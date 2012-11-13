module ETapestry
  class BaseView < Watirmark::Page
    navigation_keyword(:save_button)  {content.button(:value, 'Save And')}

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