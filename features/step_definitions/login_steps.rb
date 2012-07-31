Given /^I login as user '([^']*)' with password '([^']*)'$/ do |name, password|
  Login.new(LoginModel.new(:username=>name, :password=>password)).login
end

Given /^I login as (\[[^\]]+\])$/ do |model|
  Login.new(model).login
end

Given /^I login as (\[[^\]]+\]) with values$/ do |model, table|
  Login.new(model.merge_cucumber_table(table)).login
end

Given /^I logout/ do
  Login.new.logout
end

Then /I should be logged in/ do
  LoginView.logout_link.when_present.should_not raise_error Timeout::Error
end
