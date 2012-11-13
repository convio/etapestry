$: << File.expand_path(File.join(File.dirname(__FILE__), 'lib'))

begin
  sh "bundle install" if File.dirname(__FILE__) =~ /\/(hudson|mnt)\/workspace\//
rescue Gem::RemoteFetcher::FetchError
  puts "Unable to connect - retrying #{Time.now}"
  retry
end

require 'bundler/setup'
require 'cucumber/rake/task'

module RakeHelper
  def self.cucumber_task(task_name, files=nil)
    Cucumber::Rake::Task.new(task_name) do |t|
      t.cucumber_opts = "-r features #{FileList[files]} -b --format html -o reports/report.html --format pretty"
    end
  end
end

RakeHelper.cucumber_task(:account, "features/account/**/*.feature")

RakeHelper.cucumber_task(:login, "features/login/**/*.feature")

