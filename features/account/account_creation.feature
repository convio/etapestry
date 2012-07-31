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

  Scenario: Should be able to create an account with the full complement of fields for a constituent role
    When I create a [new account: account] with values
      | constituent_role | true |
      | recognition_name | recognition |
      | recognition_type | Anonymous |
      | persona_type     | Business |
      | start_date       | 01/01/2000 |
      | end_date         | 01/02/2020 |
      | address          | 3405 Mulberry Creek Dr |
      | city             | Austin |
      | state            | TX |
      | postal_code      | 78732 |
      | county           | Travis |
      | country          | United States |
      | voice            | 555-111-1111 |
      | fax              | 555-222-2222 |
      | mobile           | 555-333-3333 |
      | web_page         | http://www.yahoo.com |
      | note             | notes |
      | short_salutation | short hi |
      | long_salutation  | long hi |
    Then the account [account] should be created properly


