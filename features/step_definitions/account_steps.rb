Given /^I create a (\[new add_account: \S+\]) with values$/ do |model, table|
  AddAccount.new(model.merge_cucumber_table(table)).create
end

Given /^I create a (\[new add_account: \S+\])$/ do |model|
  AddAccount.new(model).create
end

Then /^I should see the (\[[^\]]+\]) on the persona page/ do |model|
  Persona.new(model).verify
end