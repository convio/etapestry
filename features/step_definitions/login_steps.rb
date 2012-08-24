Given /^I login as user '([^']*)' with password '([^']*)'$/ do |name, password|
  Login::Admin.new(Login::AdminModel.new(:username=>name, :password=>password)).login
end

Given /^I login as (\[[^\]]+\])$/ do |model|
  Login::Admin.new(model).login
end

Given /^I login as (\[[^\]]+\]) with values$/ do |model, table|
  Login::Admin.new(model.merge_cucumber_table(table)).login
end

Given /^I logout/ do
  Login::Admin.new.logout
end

Then /I should be logged in/ do
  Login::AdminView.logout_link.when_present.should_not raise_error Timeout::Error
end
