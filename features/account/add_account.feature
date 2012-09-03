@account
Feature: Account creation

  Background:
    Given I login as [new Login::Admin user_login]

  Scenario: Should be able to create an account with the minimum number of fields
    When I create a [new Account::Record account_min_fields]
    Then I should see the [account_min_fields] on the Other page

  @catch-post-failure
  Scenario: Should not be able to create an account without default fields populated
    When I create a [new Account::Record account_no_defaults] with values
      | other.name      |  |
      | other.sort_name |  |
    Then I should see the error: /Account Name: This field must be completed prior to saving.\s*Sort Name: This field must be completed prior to saving./

  @catch-post-failure
  Scenario: Should not be able to create an account without a name
    When I create a [new Account::Record account_sort_name_only] with values
      | other.name |  |
    Then I should see the error: /Account Name: This field must be completed prior to saving./

  @catch-post-failure
  Scenario: Should not be able to create an account without a search name
    When I create a [new Account::Record account_name_only] with values
      | other.sort_name |  |
    Then I should see the error: /Sort Name: This field must be completed prior to saving./

  Scenario: Should be able to create an account with the full complement of fields for a constituent role
    When I create a [new Account::Record account_all_values] with values
      | constituent_role         | true                   |
      | other.recognition_name   | recognition            |
      | other.recognition_type   | Anonymous              |
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
    Then the account header for [account_all_values] should contain the correct information
    And I should see the [account_all_values] on the Persona page
    And I should see the [account_all_values] on the Other page



