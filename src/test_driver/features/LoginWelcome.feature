Feature: LoginWelcome
  Scenario: When we are in the welcome page and the login is clicked
    Given I have "loginWelcome"
    When I tap the "loginWelcome" button
    Then I should have "LoginPage" on screen


