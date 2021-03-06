module ETapestry
  class BaseController < Watirmark::WebPage::Controller
    def submit
      alert = Page.browser.close_alert do
        if @view.save_button.exists?
          Watir::Wait.until {@view.save_button.enabled?}
          @view.save_button.click
        else
          raise Watirmark::TestError, "No submit button found or defined for this form"
        end
      end
      if Watirmark::Session.instance.buffer_post_failure
        Watirmark::Session.instance.post_failure = alert.gsub("\s*\n\s*", " ")
      else
        raise Watirmark::PostFailure, alert if alert
      end
    end
  end
end