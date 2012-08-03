Given /^I create a (\[new account: \S+\]) with values$/ do |model, table|
  Account.new(model.merge_cucumber_table(table)).create
end

Given /^I create a (\[new account: \S+\])$/ do |model|
  Account.new(model).create
end

Then /^I should see the (\[[^\]]+\]) on the persona page/ do |model|
  Persona.new(model).verify
end

Then /^the account header for (\[[^\]]+\]) should contain the correct information/ do |model|
  AccountHeader.new(model).verify
end