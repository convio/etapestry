@login
Feature: Normal path for logging into the site

  Background:
    Given  I create a model [new Login::Admin user_login]
    And I logout

  Scenario: Login with valid username and password
    When I login as [user_login]
    Then I should be logged in

  @catch-post-failure
  Scenario: Login with no username and password
    When I login as [user_login] with values
      | username |  |
      | password |  |
    Then I should see the error: /Please enter your login id Please enter your password/

  @catch-post-failure
  Scenario: Login with no password
    When I login as [user_login] with values
      | password |  |
    Then I should see the error: /Please enter your password/

  @catch-post-failure
  Scenario: Login with no username
    When I login as [user_login] with values
      | username |  |
    Then I should see the error: /Please enter your login id Please enter your password/

  @catch-post-failure
  Scenario: Login with invalid username
    When I login as [user_login] with values
      | username | username_does_not_exist |
    Then I should see the error: /Please enter your password/

  @catch-post-failure
  Scenario: Login with invalid password
    When I login as [user_login] with values
      | password | bad_password |
    Then I should see the error: /Invalid login id or password/

  Scenario: Should not allow multiple logins at the same time

  Scenario: Should be able to force a login when multiple sessions detected
  # Note: there's a bug here where in cases where you force the login, the dashboard
  # components never load

  Scenario: Should handle a login from the same session gracefully (when not logged out)

