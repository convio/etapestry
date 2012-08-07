Given /^I create a (\[new Account::Record \S+\]) with values$/ do |model, table|
  Account::Record.new(model.merge_cucumber_table(table)).create
end

Given /^I create a (\[new Account::Record \S+\])$/ do |model|
  Account::Record.new(model).create
end

Then /^I should see the (\[[^\]]+\]) on the Persona page/ do |model|
  Account::Persona.new(model).verify
end

Then /^the account header for (\[[^\]]+\]) should contain the correct information/ do |model|
  Account::Header.new(model).verify
end

Then /^I should see the (\[[^\]]+\]) on the Other page/ do |model|
  Account::Other.new(model).verify
end