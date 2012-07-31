module Watirmark
  class Session

    def self.page_load
      return if Page.browser.url =~ /Login.jsp/
      Watir::Wait.until do
        Page.browser.html.include?("<!-- elapsed:")
      end
      Page.browser.frames.each do |frame|
        Watir::Wait.until {!frame.div(:id=> /asyncTileLoader/,:text => /Retrieving Content/).exists?}
      end
    end
    Watirmark::Session::POST_WAIT_CHECKERS << Proc.new { Watirmark::Session::page_load }
  end
end
