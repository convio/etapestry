require 'watirmark/session'

module Watirmark
  class Session
    def self.post_errors
      message = ''
      if Page.browser.table(:class, 'error').present?
        message = Page.browser.table(:class, 'error').text
      elsif  Page.browser.h2s(:class, "invalidText").size > 0
        message = Page.browser.h2s(:class, "invalidText").map(&:text).join(' ').strip
      end
      return if message.empty?
      if @@buffer_post_failure
        @@post_failure = message.strip
      else
        raise Watirmark::PostFailure, message.strip
      end
    end

    Watirmark::Session::POST_WAIT_CHECKERS << Proc.new { Watirmark::Session::post_errors }
  end
end
