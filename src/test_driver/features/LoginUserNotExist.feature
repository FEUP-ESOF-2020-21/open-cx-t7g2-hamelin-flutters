Feature: As someone who is registered in the app, I want to be able to login, so that I can use the app with my permissions.
  Scenario: When the user does not exist and tries to loggin
    Given I have "loginWelcome"
    When I tap the "loginWelcome" button
    Then I should have "LoginPage" on screen
    When I fill the "usernameField" field with "doesNotExist"
    And I fill the "passfield" field with "1"
    Then I tap the "LoginButton" button
    Then I should have "LoginPage" on screen
    Then I should have "BadLogin" on screen
    
  


