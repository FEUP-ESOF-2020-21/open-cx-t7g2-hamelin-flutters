Feature: As someone who is envolved in the conference, I want to be able to register in the app, so that I can use it.
  Scenario: When the user fills the form with an existing user
    Given I have "registerWelcome"
    When I tap the "registerWelcome" button
    Then I should have "RegisterPage" on screen
    When I fill the "fullNameRegister" field with "Taken username test"
    And I fill the "usernameFieldRegister" field with "trump"
    And I fill the "profileRegister" field with "https://www.google.com/url?sa=i&url=http%3A%2F%2Fwww.trasysinternational.com%2F2015%2F07%2F01%2F10-key-contributors-to-project-success%2F&psig=AOvVaw1aY5g96yTlZJlqyLZ7cnMA&ust=1608140307349000&source=images&cd=vfe&ved=0CAIQjRxqFwoTCOC46dLD0O0CFQAAAAAdAAAAABAO"
    And I fill the "passfield" field with "bigSecurePass123"
    Then I tap the "registerButton" button
    Then I should have "RegisterPage" on screen

  


