Given /^I create a (\[new account: \S+\]) with values$/ do |model, table|
  Account.new(model.merge_cucumber_table(table)).create
end

Given /^I create a (\[new account: \S+\])$/ do |model|
  Account.new(model).create
end

Then /^the account (\[[^\]]+\]) should be created properly/ do |model|
  Account.new(model).verify
end