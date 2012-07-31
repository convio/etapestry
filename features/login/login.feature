@login
Feature: Normal path for logging into the site

  Background:
    Given  I create a model [new login: user_login] with values
      | username | Hugh.McGowan@blackbaud.com |
      | password | luminate                   |
    And I logout

  Scenario: Login with valid username and password
    When I login as [user_login]
    Then I should be logged in

  @catch-post-failure
  Scenario: Login with no username and password
    When I login as [user_login] with values
      | username |  |
      | password |  |
    Then I should see the error: /The Login id\/password combination you entered is not valid./

  @catch-post-failure
  Scenario: Login with no password
    When I login as [user_login] with values
      | password |  |
    Then I should see the error: /The Login id\/password combination you entered is not valid./

  @catch-post-failure
  Scenario: Login with no username
    When I login as [user_login] with values
      | username |  |
    Then I should see the error: /The Login id\/password combination you entered is not valid./

  @catch-post-failure
  Scenario: Login with invalid username
    When I login as [user_login] with values
      | username | username_does_not_exist |
    Then I should see the error: /The Login id\/password combination you entered is not valid./

  @catch-post-failure
  Scenario: Login with invalid password
    When I login as [user_login] with values
      | password | bad_password |
    Then I should see the error: /The Login id\/password combination you entered is not valid./

  Scenario: Should not allow multiple logins at the same time

  Scenario: Should handle a login from the same session gracefully (when not logged out)
