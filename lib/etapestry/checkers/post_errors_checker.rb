require 'watirmark/session'

module Watirmark
  class Session
    def self.post_errors
      if Page.browser.table(:class, 'error').present?
        message = Page.browser.table(:class, 'error').text
        if @@buffer_post_failure
          @@post_failure = message.strip
        else
          raise Watirmark::PostFailure, message.strip
        end
      end
    end

    Watirmark::Session::POST_WAIT_CHECKERS << Proc.new { Watirmark::Session::post_errors }
  end
end
