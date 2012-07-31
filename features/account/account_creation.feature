@account
Feature: Account creation

  Background:
    Given  I create a model [new login: user_login]
    And I login as [user_login]

  Scenario: Should be able to create an account with the minimum number of fields
    When I create a [new account: account]

  @catch-post-failure
  Scenario: Should not be able to create an account without default fields populated
    When I create a [new account: account_no_defaults] with values
      | name | |
      | sort_name | |
    Then I should see the error: /Account Name: This field must be completed prior to saving.\s*Sort Name: This field must be completed prior to saving./

  @catch-post-failure
  Scenario: Should not be able to create an account without a name
    When I create a [new account: account_sort_name_only] with values
      | name | |
    Then I should see the error: /Account Name: This field must be completed prior to saving./

  @catch-post-failure
  Scenario: Should not be able to create an account without a search name
    When I create a [new account: account_name_only] with values
      | sort_name | |
    Then I should see the error: /Sort Name: This field must be completed prior to saving./


