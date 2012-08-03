@account
Feature: Account creation

  Background:
    Given I login as [new login: user_login]

  Scenario: Should be able to create an account with the minimum number of fields
    When I create a [new account: account_min_fields]

  @catch-post-failure
  Scenario: Should not be able to create an account without default fields populated
    When I create a [new account: account_no_defaults] with values
      | name      |  |
      | sort_name |  |
    Then I should see the error: /Account Name: This field must be completed prior to saving.\s*Sort Name: This field must be completed prior to saving./

  @catch-post-failure
  Scenario: Should not be able to create an account without a name
    When I create a [new account: account_sort_name_only] with values
      | name |  |
    Then I should see the error: /Account Name: This field must be completed prior to saving./

  @catch-post-failure
  Scenario: Should not be able to create an account without a search name
    When I create a [new account: account_name_only] with values
      | sort_name |  |
    Then I should see the error: /Sort Name: This field must be completed prior to saving./

  Scenario: Should be able to create an account with the full complement of fields for a constituent role
    When I create a [new account: account] with values
      | constituent_role         | true                   |
      | recognition_name         | recognition            |
      | recognition_type         | Anonymous              |
      | persona.persona_type     | Business               |
      | persona.start_date       | 1/1                    |
      | persona.end_date         | 1/2                    |
      | persona.address          | 3405 Mulberry Creek Dr |
      | persona.city             | Austin                 |
      | persona.state            | TX                     |
      | persona.postal_code      | 78732                  |
      | persona.county           | Travis                 |
      | persona.country          | United States          |
      | persona.voice            | (555) 111-1111         |
      | persona.fax              | (555) 222-2222         |
      | persona.mobile           | (555) 333-3333         |
      | persona.web_page         | http://www.yahoo.com   |
      | persona.note             | notes                  |
      | persona.short_salutation | short hi               |
      | persona.long_salutation  | long hi                |
    Then I should see the [account] on the persona page
    And the account header for [account] should contain the correct information



