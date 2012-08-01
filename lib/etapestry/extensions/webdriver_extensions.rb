module Watir

  # back out the change for checkers as in this app there are alerts on post
  # and with this change it closes them automatically. TODO: find a better solution in the watirmark lib
  class Browser
    def run_checkers
      old_run_checkers
    end

    # Add this back in from Watir-Webdriver 0.5 as the alert is closed
    # before we can detect it, if we use the new API
    def close_alert(&blk)
      execute_script "window.alert = function(msg) { window.__lastWatirAlert = msg; }"
      yield
      execute_script "return window.__lastWatirAlert"
    end

  end
end