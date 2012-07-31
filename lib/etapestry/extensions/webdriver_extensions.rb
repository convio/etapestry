module Watir

  # back out the change for checkers as in this app there are alerts on post
  # and with this change it closes them automatically. TODO: find a better solution in the watirmark lib
  class Browser
    def run_checkers
      old_run_checkers
    end
  end
end