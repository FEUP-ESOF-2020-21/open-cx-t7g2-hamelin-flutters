Feature: LoginWelcome
  Scenario: When we are in the welcome page and the login is clicked
    Given I have "loginWelcome"
    When I tap the "loginWelcome" button
    Then I should have "LoginPage" on screen
    When I fill the "usernameField" field with "trump"
    And I fill the "passfield" field with "1"
    Then I tap the "LoginButton" button
    Then I should have "HomePage" on screen


